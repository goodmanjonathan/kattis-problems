def lcs(X , Y): 
    # find the length of the strings 
    m = len(X) 
    n = len(Y) 
  
    # declaring the array for storing the dp values 
    L = [[None]*(n+1) for i in xrange(m+1)] 
  
    """Following steps build L[m+1][n+1] in bottom up fashion 
    Note: L[i][j] contains length of LCS of X[0..i-1] 
    and Y[0..j-1]"""
    for i in range(m+1): 
        for j in range(n+1): 
            if i == 0 or j == 0 : 
                L[i][j] = ""
            elif X[i-1] == Y[j-1]: 
                L[i][j] = L[i-1][j-1]+X[i-1]
            else:
                if len(L[i-1][j]) > len(L[i][j-1]):
                    L[i][j] = L[i-1][j]
                else:
                    L[i][j] = L[i][j-1]
  
    # L[m][n] contains the length of LCS of X[0..n-1] & Y[0..m-1] 
    return L[m][n]
#end of function lcs 
  
  
# Driver program to test the above function
X = raw_input()
print 26 - len(lcs(X, "abcdefghijklmnopqrstuvwxyz")) 
