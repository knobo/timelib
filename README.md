# timelib
Lisp interface for time.h

Currently only supports x86_64-linux-gnu

# Example

``` cl
(tl:parse-time-string "2018-11-04T13:00:00")
(tl:parse-time-string "04/Nov/2018:06:27:30 +0100" "%d/%b/%Y:%H:%M:%S %z")
```
