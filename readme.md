# qb-namechange

Simple name change script, original code provided by **CodeRed#9790** in the qbcore discord. I only put it into it's own package.

* Add to `qb-core\shared\items.lua`

```lua
['edit_names'] = {['name'] = 'edit_names',['label'] = 'ID edit_names',['weight'] = 0, ['type'] = 'item',['image'] = 'edit_names.png',     ['unique'] = true, ['useable'] = true, ['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'you can change your name with this card'},
```

* Copy the image from the `/images` folder to `qb-inventory/html/images`
