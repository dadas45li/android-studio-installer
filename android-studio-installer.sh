#!/bin/bash
if [ "$USER" == "root" ]
then
echo "Lütfen android studionun sitesinden indirdiğiniz zip dosyasının konumunu girin:"
echo "elinizde zip yoksa şuradan edinebilirsiniz: "
read konum
if [ -f "$konum" ]
then
cd /tmp
rm -rf /tmp/*
echo "Zip ayıklanıyor."
unzip $konum > /dev/null
#çalıştırılabilir betik hazırlama
echo "Dosyalar kontrol ediliyor."
if [ -d /tmp/android-studio ]
then
echo "Dosyalar Taşınıyor."
if [ -d /opt/android-studio ]
then 
rm -rf /opt/android-studio/
fi
mv /tmp/android-studio /opt/android-studio
echo "Betik Hazırlanıyor."
echo "cd /opt/android-studio/bin/" > /usr/bin/android-studio
echo "/opt/android-studio/bin/studio.sh" >> /usr/bin/android-studio

#başlatıcı yazma
echo "Başlatıcı oluşturuluyor."
echo "[Desktop Entry]" > /usr/share/applications/android-studio.desktop
echo "Name=Android Studio" >> /usr/share/applications/android-studio.desktop
echo "Comment=Android developer tool" >> /usr/share/applications/android-studio.desktop
echo "GenericName=Android IDE" >> /usr/share/applications/android-studio.desktop
echo "Exec=/usr/bin/android-studio" >> /usr/share/applications/android-studio.desktop
echo "Icon=/opt/android-studio/bin/studio.png" >> /usr/share/applications/android-studio.desktop
echo "Type=Application" >> /usr/share/applications/android-studio.desktop
echo "StartupNotify=true" >> /usr/share/applications/android-studio.desktop
echo "Categories=GNOME;GTK;Utility;TextEditor;Development;" >> /usr/share/applications/android-studio.desktop
echo "İzinler ayarlanıyor."
chmod +x /usr/share/applications/android-studio.desktop
chmod +x /usr/bin/android-studio
echo "Bitti."
else
echo "Bu zip android studioya ait değil."
rm -rf /tmp/*
fi
else
echo "Dosya bulunamadı"
fi
else
echo "Bu işlem için root yetkisi gerekir."
fi
