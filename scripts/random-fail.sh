
if [ $# -ne 1 ]; then
  echo " syntax: random-fail.sh FILE "
  echo "
  This function will return the number of digits (as opposed to letters)
  in the first column of the first row of the FILE.  However, it randomly
  fails 5% of the time.
  
  "
  exit 1;
fi

FILE=$1

fail_it=$(echo $RANDOM | awk '{printf("%d", $1/32767.0 < 0.05);}')

if [ $fail_it -eq 1 ]; then
  echo "Holy Crap! Randomly failed on file $FILE" > /dev/stderr
  exit 1;
fi

awk '
  NR == 1 {
    word = $1;
    n = split(word, a, "");
    for(i=1;i<=n;i++) {
      if(a[i]~/[0-9]/)
        Digits++
    }
    printf("%d\n", Digits);
    exit;
  }
' $FILE