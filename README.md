# Command Run Robot Framework

## Common

- robot search.robot                    # คำสั่งทั่วไป
- robot -d Result search.robot          # สั่นรันและให้สร้าง folder output
- robot -d Result Testsuites            # สั่นรันทุก suite ที่อยู่ใน folder Testsuites

## Run With Test Case

- robot -t "Test001 Try To Open Browser" -d Result search.robot     # รันข้อที่มีชื่อ "Test001 Try To Open Browser"

## Run With Tags

- robot -i Test1 -d Result search.robot                 # รันทุกข้อที่มี tag Test1
- robot -i Search -e OnHold -d Result search.robot      # รันทุกข้อที่มี tag Search และ ไม่รันข้อที่มี tag OnHold
- robot -i Test1ANDSearch -d Result search.robot        # รันทุกข้อที่มี tag Test1 และ test Search

## Run With Variables

- robot -i Test1 -d Result -v lang:EN search.robot                      # รันและสร้าง ตัวแปรเพิ่มด้วยชื่อ lang มีค่าเป็น EN
- robot -i Test1 -d Result -v lang:TH search.robot                      # รันและสร้าง ตัวแปรเพิ่มด้วยชื่อ lang มีค่าเป็น TH
- robot -i Test1 -d Result -v lang:EN -v test_site:DEV search.robot     # รันและสร้าง ตัวแปรเพิ่มด้วยชื่อ lang มีค่าเป็น EN และ test_site ที่มีค่าเป็น DEV
