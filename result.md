class: center, middle, inverse

# API prototype
by Phoenix web framework

---
# Design goals
- high rendering performance (json, xml, json)
- high concurrency

---
# Conponents
- ja_serializer https://github.com/vt-elixir/ja_serializer
- xml_builder https://github.com/joshnuss/xml_builder
- ...

---
# Performance testing 1 - xml

### xml
- `[debug] QUERY OK source="prices" db=3403.5ms decode=39.2ms queue=0.1ms`
- [info] Sent 200 in **4399ms**

- `[debug] QUERY OK source="prices" db=9885.7ms decode=48.1ms queue=0.1ms`
- [info] Sent 200 in **10894ms**

- `[debug] QUERY OK source="prices" db=33.5ms decode=54.0ms queue=0.1ms`
- [info] Sent 200 in **1069ms**

- `[debug] QUERY OK source="prices" db=3240.5ms decode=35.6ms queue=0.1ms`
- [info] Sent 200 in **4253ms**

---
#  Performance testing 1 - csv

### csv
- `[debug] QUERY OK source="prices" db=5433.5ms decode=36.8ms queue=0.1ms`
- [info] Sent 200 in **5492ms**

- `[debug] QUERY OK source="prices" db=162.1ms decode=50.2ms`
- [info] Sent 200 in **241ms**

- `[debug] QUERY OK source="prices" db=4963.3ms decode=35.5ms`
- [info] Sent 200 in **5018ms**

- `[debug] QUERY OK source="prices" db=48.3ms decode=43.7ms queue=0.1ms`
- [info] Sent 200 in **112ms**

---
#  Performance testing 1 - json

### json

- `[debug] QUERY OK source="prices" db=3088.6ms decode=45.7ms`
- [info] Sent 200 in **3698ms**

- `[debug] QUERY OK source="prices" db=3152.7ms decode=51.7ms queue=0.1ms`
- [info] Sent 200 in **3795ms**

- `[debug] QUERY OK source="prices" db=4846.6ms decode=44.6ms queue=0.1ms`
- [info] Sent 200 in **5470ms**

- `[debug] QUERY OK source="prices" db=35.7ms decode=34.1ms queue=0.1ms`
- [info] Sent 200 in **692ms**


---
# Performance testing 2
### json
- `[debug] QUERY OK source="prices" db=77.8ms decode=47.5ms queue=0.4ms`
- [info] Sent 200 in **741ms**

- `[debug] QUERY OK source="prices" db=64.2ms decode=49.1ms queue=0.1ms`
- [info] Sent 200 in **697ms**

### xml
- `[debug] QUERY OK source="prices" db=47.4ms decode=58.5ms queue=0.1ms`
- [info] Sent 200 in **1082ms**

- `[debug] QUERY OK source="prices" db=61.9ms decode=54.4ms queue=0.1ms`
- [info] Sent 200 in **1118ms**

### csv
- `[debug] QUERY OK source="prices" db=55.6ms decode=53.4ms queue=0.1ms`
- [info] Sent 200 in **136ms**

- `[debug] QUERY OK source="prices" db=46.2ms decode=38.7ms queue=0.1ms`
- [info] Sent 200 in **106ms**

---

# Learning
+ Elixir
    + Functional programming
    + productivity and performance
    + ...
+ Phoenix
    + Hex
    + Ecto
    + ..
+ Debugging
+ ...
---

# Next
+ ...

---
# Useful links
- Elixir School https://elixirschool.com/
- Phoenix and Elixir slack channel https://elixir-lang.slack.com/
- ...


---
class: center, middle

# `The End`
