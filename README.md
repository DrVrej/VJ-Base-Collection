# VJ Base Collection

A collection of official **VJ Base mods** for Garry's Mod, maintained together in a single repository.

Each mod remains in its own folder under [`addons/`](./addons/) so it can still be loaded by Garry's Mod as an individual addon while being developed and maintained from one repository.

## Links

Other official VJ Base projects and releases that are maintained separately from this repository.

- [Steam Workshop Pages](https://steamcommunity.com/workshop/filedetails/?id=150007625)
- [VJ Base](https://github.com/DrVrej/VJ-Base)
- [VJ HUD](https://github.com/DrVrej/VJ-HUD)
- [Half-Life Resurgence](https://github.com/VJ-HLR-Developers/Half-Life-Resurgence)

## Development Setup

It is recommended that you **do not** clone this repository directly into Garry's Mod's `addons` folder. Instead, each mod folder can be linked into `garrysmod/addons/` using directory junctions. This allows the repository to remain anywhere on your computer while Garry's Mod sees each folder as a normal addon.

> [!IMPORTANT]
> Adding, editing, or deleting files *inside* a junction affects the actual files in this repository. To remove a junction, remove the junction itself rather than deleting its contents.

### Creating Junctions

To automatically create a junction inside Garry's Mod's `addons` folder for every mod in this repository, open **Command Prompt** and run:

```bat
for /D %D in ("F:\examplePath\VJ-Base-Collection\addons\*") do mklink /J "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\addons\%~nxD" "%~fD"
```

To create a junction for an individual mod:

```bat
mklink /J "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\addons\Mod Name" "F:\examplePath\VJ-Base-Collection\addons\Mod Name"
```

### Verifying Junctions

To list the junctions inside Garry's Mod's `addons` folder:

```bat
dir /AL "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\addons"
```

They will appear as `<JUNCTION>` entries.

### Removing Junctions

Removing a junction does **not** remove the actual files; it only removes the link.

```bat
rmdir "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\addons\Mod Name"
```