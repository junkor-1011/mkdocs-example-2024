# Markdown Examples

## Code Blocks

### bash

```sh
#!/usr/bin/env bash
set -euxo pipefail

echo Hello World!
echo ${UID}
```

### Python

```python
from datetime import datetime

def main():
    now = datetime.now()
    print(f"It is {now.isoformat()}")
```

## Table

| First Header | Second Header |
|--------------|---------------|
| 1            | 2             |
| 3            | 4             |
| 5            | 6             |
