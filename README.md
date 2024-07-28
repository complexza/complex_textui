# Text UI

Inspired by NP 4.0's Text UI
Made using the Svelte framework and the CFX Lua API with the template [bl_svelte_template](https://github.com/Byte-Labs-Project/bl_svelte_template)

![image](https://github.com/user-attachments/assets/f28c83bc-fc96-4f2b-9521-c900d7e905ea)

## Usage

## Available Positions
```
    'top-left'
    'top-middle',
    'top-right'
    'middle-left'
    'middle-middle'
    'middle-right'
    'bottom-left'
    'bottom-middle'
    'bottom-right'
```

### Show UI

```lua
exports.complex_textui.showTextUI(text, keybind, position)
```

### Hide UI

```lua
exports.complex_textui.hideTextUI()
```

### Change Text

```lua
exports.complex_textui.changeText(text)
```

### Change Keybind

```lua
exports.complex_textui.changeKeybind(keybind)
```
