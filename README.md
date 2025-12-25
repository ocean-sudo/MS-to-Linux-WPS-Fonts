# MS-to-Linux-WPS-Fonts

将常用的 Windows 字体安装到 Linux（适配 WPS / Office）。

## 一行安装

```bash
curl -fsSL https://raw.githubusercontent.com/ocean-sudo/MS-to-Linux-WPS-Fonts/main/install.sh | bash
```

默认安装到 `~/.local/share/fonts/ms-wps`，并自动刷新字体缓存。

## 环境要求

- `bash`、`curl`
- `python3`（用于解压 zip）
- `fontconfig`（提供 `fc-cache` 刷新字体缓存）

## 字体列表

| 字体 | 文件 |
| --- | --- |
| Arial | arial.ttf, arialbd.ttf, ariali.ttf, arialbi.ttf |
| Arial Narrow | ARIALN.TTF, ARIALNB.TTF, ARIALNI.TTF, ARIALNBI.TTF |
| Calibri | calibri.ttf, calibrib.ttf, calibrii.ttf, calibril.ttf, calibrili.ttf, calibriz.ttf |
| Cambria | cambria.ttc |
| Courier New | cour.ttf, courbd.ttf, couri.ttf, courbi.ttf, coure.fon, couree.fon, coureg.fon, courer.fon, couret.fon, courf.fon, courfe.fon, courfg.fon, courfr.fon, courft.fon |
| MT Extra | MTEXTRA.TTF |
| Symbol | symbol.ttf |
| Times New Roman | times.ttf, timesbd.ttf, timesi.ttf, timesbi.ttf |
| Webdings | webdings.ttf |
| Wingdings | wingding.ttf |
| 微软雅黑 | msyh.ttc, msyhbd.ttc |
| 仿宋 | simfang.ttf |
| 黑体 | simhei.ttf |
| 楷体 | simkai.ttf |
| 宋体 | simsun.ttc |
