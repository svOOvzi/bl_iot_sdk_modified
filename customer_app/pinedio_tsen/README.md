# BL602 / BL604 Internal Temperature Sensor Firmware

Read the article: https://lupyuen.github.io/articles/tsen

This firmware reads the Internal Temperature Sensor on BL602 and BL604.

At the BL604 Command Prompt, enter...

```bash
read_tsen
```

We should see...

```text
temperature = 43.725010 Celsius
Returned Temperaure = 43 Celsius
```

To read the temperature as float (instead of integer)...

```bash
read_tsen2
```

We should see...

```text
offset = 2175
temperature = 45.143814 Celsius
Returned Temperaure = 45.143814 Celsius
```

See [`pinedio_tsen/demo.c`](pinedio_tsen/demo.c)
