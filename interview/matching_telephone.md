## Output the telephone numbers which match the regex rule. 

```bash
grep -oE '\b(\d{3}-|\(\d{3}\))?\d{3}-\d{4}\b' telephone.data

# (\d{3}-|\(\d{3}\))? stand for [0-9]{3} or ([0-9]{3}) for zero or one or more times 
# \b starnd for boundary, equal to ^$
```

## very useful website for regex
> https://regex101.com/