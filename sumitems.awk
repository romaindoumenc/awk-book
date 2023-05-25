# items – sum items and quantities
#  input: a par of space-separated items and quantities
#  output: the sum of quantities per item, sorted

NF != 2 { print "line " NR " has invalid format. Want item quantity" }

          { items[$1] += $2 }

END      { for (i in items)
              printf("%s: %g\n", i, items[i]) | "sort"
          }