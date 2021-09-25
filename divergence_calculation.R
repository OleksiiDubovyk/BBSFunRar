centroid <- function(x){
  l <- vector(mode = "list", length = ncol(x))
  for (j in 1:ncol(x)){
    if (is.numeric(x[j][[1]])){
      l[[j]] <- mean(x[j][[1]])
    }else if (is.factor(x[j][[1]])){
      l[[j]] <- summary(x[j][[1]])/nrow(x)
    }
  }
  names(l) <- colnames(x)
  l
}

cat_dist <- function(value, mx, freqs){
  distances <- mx[, which(colnames(mx) == value)] # distances between the value and all other possible values
  ws <- matrix(NA, ncol = 2, nrow = length(freqs))
  colnames(ws) <- c("distance", "weight")
  rownames(ws) <- colnames(mx)
  for (cat in colnames(mx)){
    ws[cat,] <- c(distances[cat], ifelse(cat == value, 0, freqs[cat]))
  } # two arranged vectors of distances and weights of the categories (self-similarity means 0 distinctiveness)
  sum(ws[,1]*ws[,2]) / max(ws[,1]) # normalized by the maximum possible distinctiveness
}

group_overlap <- function(vec, cen){
  vec <- vec/sum(vec)
  cen <- unlist(cen)/sum(unlist(cen))
  overlap <- sapply(1:length(vec), function(i) min(vec[i], cen[i]))
  sum(overlap)
}

distinct <- function(x, cen, numind, catind, catmxs, grind){
  #x : dataframe with cols-traits and rows-species
  #cen : list with names-traits and values {mean for numeric, vector of freqs for categorical}
  #numind : vector of numeric variables indices or names
  #catind : vector of categorical variables indices or names
  #catmxs : named (=traits) list of distance matrices for categorical variables
  #grind : named (=name of group) list of names of trait variables {e.g., ns: nsbank, nsground,...}
  #
  #numeric variables
  numvals <- matrix(NA, nrow = nrow(x), ncol = length(numind))
  colnames(numvals) <- numind
  rownames(numvals) <- rownames(x)
  for (trait in numind){
    numvals[,trait] <- sapply(x[,trait], function(taxa_value){
      abs(taxa_value - unlist(cen[trait]))
    })
  }
  #categorical variables
  catvals <- matrix(NA, nrow = nrow(x), ncol = length(catind))
  colnames(catvals) <- catind
  rownames(catvals) <- rownames(x)
  for (trait in catind){
    mx <- catmxs[trait][[1]]
    sp <- 1
    for (taxa_value in x[,trait]){
      catvals[sp, trait] <- cat_dist(value = taxa_value, 
                                     mx = mx, 
                                     freqs = cen[trait][[1]])
      sp <- sp+1
    }
  }
  #grouped variables
  grvals <- matrix(NA, nrow = nrow(x), ncol = length(grind))
  rownames(grvals) <- rownames(x)
  colnames(grvals) <- names(grind)
  for (trait in names(grind)){
    traits <- grind[trait][[1]]
    for (taxa in rownames(x)){
      grvals[taxa, trait] <- group_overlap(vec = unlist(x[taxa, traits]), 
                                         cen = unlist(cen[traits]))
    }
  }
  
  grdist <- matrix(NA, nrow = nrow(x), ncol = length(grind))
  rownames(grdist) <- rownames(x)
  colnames(grdist) <- names(grind)
  mo <- NA
  for (trait in names(grind)){
    mo <- max(grvals[,trait])
    grdist[,trait] <- 1-(grvals[,trait]/mo)
  }
  list(numvals, catvals, grdist)
}


### test

test_df <- data.frame(n1 = c(2,4,5,6,3),
                      n2 = c(1,1.5,2,0.5,0),
                      n3 = c(3,4,1,2,5),
                      c1 = as.factor(c("red", "green", "blue", "red", "red")),
                      g1 = c(0.3,0.1,0.4,0.5,1.0),
                      g2 = c(0.2,0.1,0.6,0.0,0.0),
                      g3 = c(0.5,0.8,0.0,0.5,0.0))
rownames(test_df) <- c("A", "B", "C", "D", "E")

sapply(test_df[,"n1"], function(taxa_value){
  abs(taxa_value - unlist(test_cn["n1"]))
})

test_mx <- list(c1 = matrix(c(0.0, 0.2, 0.8,
                              0.2, 0.0, 0.4,
                              0.8, 0.4, 0.0),
                            ncol = 3, nrow = 3, byrow = T))
colnames(test_mx[[1]]) <- c("red", "green", "blue")
rownames(test_mx[[1]]) <- c("red", "green", "blue")

test_cn <- centroid(test_df)

test_grind <- list(g = c("g1", "g2", "g3"))

system.time(distinct(x = test_df, 
         cen = test_cn, 
         numind = c("n1", "n2", "n3"), 
         catind = "c1",
         catmxs = test_mx,
         grind = test_grind))

### test ends
