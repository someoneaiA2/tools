[ วิธีใช้ตอนเปิดโปรแกรม ]

 ขั้นที่ 1
- เปิดโปรแกรม
- ใส่ termux-change-repo 
- กด Enter
- เลือก Wirrors by Grimmlr
- ใส่ pkg update && pkg upgrade
- กด Enter


 ขั้นที่ 2
- termux-setup-storage -y
- กดอนุญาต

 ขั้นที่ 3
- ไปโหลดไฟล์ ที่ห้อง แจกของ
-- กดเปิดไฟล์ด้วยโปรแกรมตามคลิป
- ใช้คำสั่ง 
- pkg install git 
- pkg install jq -y
- pkg install android-tools -y
- pkg install lzip 
- pkg install tsu

ขั้นที่ 4 คำสั่งรันไฟล์
- su -c "export PATH=$PATH:/data/data/com.termux/files/usr/bin && bash /data/data/com.termux/files/home/downloads/ชื่อไฟล์.sh"
- เช่น
- su -c "export PATH=$PATH:/data/data/com.termux/files/usr/bin && bash /data/data/com.termux/files/home/downloads/main.sh"
