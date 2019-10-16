awk -v l=1000 '(NR==1){header=$0;next}
                (NR%l==2) { 
                   c=sprintf(c+1); 
                   close(file); file=FILENAME; sub(/csv$/,c".csv",file)
                   print header > file
                }
                {print $0 > file}' $1
