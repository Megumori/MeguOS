{
    inputs,
    config,
    pkgs,
    ...
}:
#host regular packages
{
    imports = [

    ];

    environment.systemPackages = with pkgs; [

    ntfs3g
    unityhub

    # Bulk upload my backups
    immich-go

    #Razer shit n camera
    openrazer-daemon
    polychromatic
    cameractrls-gtk4


    ];
}
