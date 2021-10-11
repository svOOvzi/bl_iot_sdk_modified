# BL602 / BL604 Internal Temperature Sensor Firmware

Read the article: https://lupyuen.github.io/articles/tsen

This firmware reads the Internal Temperature Sensor on BL602 and BL604.

At the BL604 Command Prompt, enter...

```text
read_tsen
```

To read the temperature as float (instead of integer)...

```text
read_tsen2
```

See [`pinedio_tsen/demo.c`](pinedio_tsen/demo.c)
