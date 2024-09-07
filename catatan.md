1. Mempersiapkan API yang akan digunakan : dari website https://newsapi.org/
    a. Model untuk berita 
    b. Service untuk berita 
    c. Implementasi service berita ke dalam UI dart 

2. Untuk flutter terutama dibagian materialapp wajib untuk menconfig warna tema terang dan gelap, jika itu tidak diconfig terlebih dahulu maka akan menyebabkan warna tema tidak akan menyatu dengan widget lain. Seperti appbar, FAB, navbar, scaffold, tabbar. Widget yang disebutkan itu termasuk widget yang ada pada bagian scaffold alias widget utama yang wajib ditampilkan dihalaman user.

3. Nah ini yang benar2 mungkin semua orang belum tau dengan fitur initialroute pada bagian materialapp, initialroute ini berfungsi untuk menginisialisasi halaman class dengan nama route.

4. Untuk menentukan tema bisa langsung dari aplikasinya atau bisa dari tema sistem.

5. Untuk melihat error pada flutter apalagi codingannya ada yang salah, bisa dicustom dengan menggunakan erorhandler kalo ngk salah.

6. Package yang dipakai untuk aplikasi ini :
    a. salomon_bottom_bar
    b. intl
    c. shimmmer
    d. carousel_slider
    e. url_launcher
    f. http
    g. google_fonts
    h. font_awesome_flutter
    i. flutter_splash_screen

7. Struktur data yang ada didalam api berita :
    a.  Model :
        - Author (String)
        - Tittle (String)
        - Description (String)
        - Urltoimage (String)
        - Url (String)
        - Content (String)
        - Publishedat (String)
    
    b. Services :
        - Untuk mendapatkan data berita dari api public
        - Untuk mencari data (query) berita sesuai kemauan user 

8. Fitur yang belum tersedia di newspedia : 
    a. Bookmark
    b. Login&register
    c. Get data by category
    d. Splashscreen
    e. Notifikasi data terbaru (jika ada data terbaru)

9. Page yang dipakai pada project ini :
    a. Homepage
    b. Profi
    c. Search 
    d. Bookmark  
    e. Setting 
    f. 

10. Method yang dipakai untuk project ini : 
    a. GET : Data berita yang terseda di homepage, mencari data sesuai query yang diinginkan oleh user
    b. POST : Membuat akun user
    C. PUT : Mereplace nama dan foto profil ke yang baru
    D. DELETE : Menghapus akun sendiri untuk mencegah hal yang tidak diinginkan, menghapus foto profil, menghapus bookmark berita


Page yang belum di fix ada dibagian splashscreen.dart dan ui tambahan untuk detail berita yang berada di icon more vert harus ada showmenu nya yang terdiri dari report berita dan share berita yang dimana share berita ini akan membagikan link berita.