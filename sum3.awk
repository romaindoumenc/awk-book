# sum3 - print sums of numeric columns
#   input: rows of integers and strings
#   output: sum of numeric columns
#     assumes every line has the same layout
#     blank lines are ignored

NR == 1 { maxfld = NF 
			 for (i = 1; i <= NF; i++)
			 	numcol[i] = isnum($i)
		  }

NF == 0 { }

		  { for (i = 1; i <= NF; i++)
		   		# if (numcol[i])
		   			sum[i] += $i
		  }

END	  { for (i = 1; i <= maxfld; i++) {
				if (numcol[i])
					printf("%g", sum[i])
				else
					printf("--")
				
				printf("%s", i < maxfld ? "\t" : "\n") 
		   }
		  }

function isnum(n) { return n ~ /^[+-]?[0-9]+(\.[0-9]+)?$/}