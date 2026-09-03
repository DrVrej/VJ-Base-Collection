# VJ Base Collection

A collection of official **VJ Base mods** for Garry's Mod, maintained together in a single repository.

Each mods remains in its own folder under [`addons/`](./addons/) so it can still be loaded by Garry's Mod as an individual addon while being developed and maintained from one repository.

## Development Setup

Recommended **not** to clone this repository directly into Garry's Mod's `addons` folder. Instead, each mod folder can be linked using directory junctions `garrysmod/addons/`. This allows the repository to remain anywhere on your computer while Garry's Mod sees each folder as a normal addon.

> [!IMPORTANT]
> Adding, editing, and deleting files *inside* a junction reflects those changes to the actual files. If you intend to remove the junction, simply delete the folder instead.

### Creating Junctions

Automatically create a junction inside Garry's Mod's `addons` folder for every mod in this repository:

```bat
for /D %D in ("F:\examplePath\VJ-Base-Collection\addons\*") do mklink /J "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\addons\%~nxD" "%~fD"
```

Individually create a junction:

```bat
mklink /j "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\addons\Example Mod" "F:\examplePath\VJ-Base-Collection\addons\Example Mod"
```

### Verifying Junctions

```bat
dir /AL "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\addons"
```

They will appear as `<JUNCTION>` entries.

### Removing Junctions

Removing a junction does **not** remove the actual files, it just removes the link.

```bat
rmdir "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\addons\Addon Name"
```