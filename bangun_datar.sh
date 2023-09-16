#!/bin/bash

  # Daftar paket yang diperlukan
  required_packages=("bc" "curl")
  function check_and_install_package() {
    if ! command -v "$1" &> /dev/null; then
        echo -e "Paket $1 tidak ditemukan. Menginstal paket..."

        # Perintah instalasi paket berdasarkan jenis sistem operasi
	      if [[ -n $(command -v pkg) ]]; then
            pkg update && pkg upgrade -y &> /dev/null
            pkg install -y "$@" &> /dev/null
        elif [[ -n $(command -v apt-get) ]]; then
            sudo apt-get update && apt-get upgrade 
            sudo apt-get install -y "$@" &> /dev/null
        elif [[ -n $(command -v yum) ]]; then
            sudo yum install -y "$@" &> /dev/null
        else
            echo -e "Sistem operasi tidak didukung. Silakan instal paket [$@] secara manual. "
            exit 1
        fi
    fi
}
  # Memeriksa dan menginstal setiap paket dalam daftar
for package in "${required_packages[@]}"; do
    check_and_install_package "$package"
done

clear

function generate_random_color() {
    echo $((RANDOM % 256))
}
# Function to print a colorful centered banner box                print_centered_banner_box() {
function print_centered_banner_box() {
    local message="$1"
    local length=${#message}
    local terminal_width=$(tput cols)
    local border_char="="
    local padding_char=" "
    local num_colors=6  # Number of available colors
    local random_color1=$(generate_random_color)
    local random_color2=$(generate_random_color)

    # Calculate the width of the box
    local box_width=$((length + 4))

    # Calculate the left padding
    local left_padding=$(( (terminal_width - box_width) / 2 ))

    # Print the top border
    printf "\e[38;5;${random_color1}m%${left_padding}s" ""
    for ((i = 0; i < box_width; i++)); do
        printf "${border_char}"
    done
    printf "\e[0m\n"

    # Print the message line with alternating colors
    printf "\e[38;5;${random_color2}m%${left_padding}s${border_char}${padding_char}${message}${padding_char}${border_char}\e[0m\n"

    # Print the bottom border
    printf "\e[38;5;${random_color1}m%${left_padding}s" ""
    for ((i = 0; i < box_width; i++)); do
        printf "${border_char}"
    done
    printf "\e[0m\n"
}

  function menu() {
    echo -e "\n"
    print_centered_banner_box "Bangun Datar"
    echo -e " "
    echo -e " 1). Bola"
    echo -e " 2). Limas"
    echo -e " 3). Ketupat"
    echo -e " 4). Persegi"
    echo -e " 5). Segitiga"
    echo -e " 6). Trapesium"
    echo -e " 7). Lingkaran"
    echo -e " 8). Jajar genjang"
    echo -e " 9). Layang-Layang"
    echo -e " 10). Persegi Panjang"
    echo -e " 0). Exit\n"
    echo -ne " [?] Pilih /menu/ : "; read pilih_menu
      if [[ ${pilih_menu} =~ ^(00|0)$ ]]; then
        sleep 0.5
        xdg-open "https://github.com/ghalangwh-official/"
        exit
      elif [[ ${pilih_menu} =~ ^(01|1)$ ]]; then
        process_bola
      elif [[ ${pilih_menu} =~ ^(02|2)$ ]]; then
        process_limas
      elif [[ ${pilih_menu} =~ ^(03|3)$ ]]; then
        process_ketupat
      elif [[ ${pilih_menu} =~ ^(04|4)$ ]]; then
        process_persegi
      elif [[ ${pilih_menu} =~ ^(05|5)$ ]]; then
        process_segitiga
      elif [[ ${pilih_menu} =~ ^(06|6)$ ]]; then
        process_trapesium
      elif [[ ${pilih_menu} =~ ^(07|7)$ ]]; then
        process_lingkaran
      elif [[ ${pilih_menu} =~ ^(08|8)$ ]]; then
        process_jajar_genjang
      elif [[ ${pilih_menu} =~ ^(09|9)$ ]]; then
        process_layang_layang
      elif [[ ${pilih_menu} =~ ^(010|10)$ ]]; then
        process_persegi_panjang
      else
        echo -e " Menu Tidak Tersedia Silahkan Pilih Dengan Benar"
        sleep 0.5
        menu
      fi
    }

        function process_bola() {
          echo -e "\n"
          print_centered_banner_box "Bola"
          echo -e " 1). Menghitung Volume"
          echo -e " 2). Mencari Luas Permukaan"
          echo -e " 0). Menu Utama"
          echo -ne " [?] Pilih /menu/bola : "; read pilih_menu_bola
            if [[ ${pilih_menu_bola} =~ ^(00|0)$ ]]; then
              menu
            elif [[ ${pilih_menu_bola} =~ ^(01|1)$ ]]; then
              process_bola_volume
            elif [[ ${pilih_menu_bola} =~ ^(02|2)$ ]]; then
              process_bola_luas_permukaan
            else
              echo -e " Menu Tidak Tersedia Silahkan Pilih Dengan Benar"
              sleep 0.5
              process_bola
            fi
          }
             # Fungsi untuk menghitung volume bola
              function process_bola_volume() {
                echo -ne " Jari-jari Bola : "; read jari_jari
                hasil=$(echo "scale=2; (4/3) * 3.14159265359 * (${jari_jari}^3)" | bc -l)
                echo -e " Menghitung Volume Bola"
                echo -e " Rumus = (4/3) * π * r^3"
                echo -e " Hasil = (4/3) * π * (${jari_jari}^3) = ${hasil}"
                echo -ne " Press (enter) to continue !";read enter;
                sleep 0.5
                process_bola
                }

              # Fungsi untuk menghitung luas permukaan bola
              function process_bola_luas_permukaan() {
                echo -ne " Jari-jari Bola : "; read jari_jari
                hasil=$(echo "scale=2; 4 * 3.14159265359 * (${jari_jari}^2)" | bc -l)
                echo -e " Menghitung Luas Permukaan Bola"
                echo -e " Rumus = 4 * π * r^2"
                echo -e " Hasil = 4 * π * (${jari_jari}^2) = ${hasil}"
                echo -ne " Press (enter) to continue !";read enter;
                sleep 0.5
                process_bola
                }

        function process_limas() {
          echo -e "\n"
          print_centered_banner_box "Limas"
          echo -e " 1). Mencari Volume"
          echo -e " 2). Mencari Luas Permukaan Alas"
          echo -e " 0). Menu Utama"
          echo -ne " [?] Pilih /menu/limas : "; read pilih_menu_limas
            if [[ ${pilih_menu_limas} =~ ^(00|0)$ ]]; then
              menu
            elif [[ ${pilih_menu_limas} =~ ^(01|1)$ ]]; then
              process_limas_volume
            elif [[ ${pilih_menu_limas} =~ ^(02|2)$ ]]; then
              process_limas_luas_permukaan_alas
            else
              echo -e " Menu Tidak Tersedia Silahkan Pilih Dengan Benar"
              sleep 0.5
              process_limas
            fi
          }

              function process_limas_volume() {
                echo -ne " Tinggi : "; read tinggi
                echo -ne " Luas Alas : "; read luas_alas
                hasil=$(echo -e "scale=2; (1/3)*${tinggi}*${luas_alas}" | bc)
                echo -e " Menghitung Volume "
                echo -e " Rumus = 1/3 x Luas alas x Tinggi"
                echo -e " Hasil = 1/3 x ${luas_alas} x ${tinggi} = ${hasil}"
                echo -ne " Press (enter) to continue !";read enter;
                sleep 0.5
                process_limas
                }
             
              function process_limas_luas_permukaan_alas() {
                echo -ne " Luas Alas : "; read luas_alas
                echo -ne " Sisi Miring : "; read sisi_miring
                hasil=$(echo -e "scale=2; ${luas_alas}+(4*(1/2)*${sisi_miring}*${sisi_miring})" | bc)
                echo -e " Menghitung Limas Permukaan Alas"
                echo -e " Rumus = Luas alas + 1/2 x Keliling Alas x Sisi Miring"
                echo -e " Hasil = ${luas_alas} + 1/2 x ${sisi_miring} x ${sisi_miring} = ${hasil}"
                echo -ne " Press (enter) to continue !"; read enter
                sleep 0.5
                process_limas
                }

        function process_ketupat() {
          echo -e "\n"
          print_centered_banner_box "Ketupat"
          echo -e " 1). Menghitung Luas"
          echo -e " 2). Mencari Keliling"
          echo -e " 0). Menu Utama"
          echo -ne " [?] Pilih /menu/ketupat : "; read pilih_menu_ketupat
          if [[ ${pilih_menu_ketupat} =~ ^(00|0)$ ]]; then
            menu
          elif [[ ${pilih_menu_ketupat} =~ ^(01|1)$ ]]; then
            process_ketupat_luas
          elif [[ ${pilih_menu_ketupat} =~ ^(02|2)$ ]]; then
            process_ketupat_keliling
          else
          echo -e " Menu Tidak Tersedia Silahkan Pilih Dengan Benar"
          sleep 0.5
          process_ketupat
          fi
          }
              function process_ketupat_luas() {               
                echo -ne " Diagonal 1 Ketupat : "; read diagonal_1
                echo -ne " Diagonal 2 Ketupat : "; read diagonal_2
                hasil=$(echo "scale=2; (${diagonal_1} * ${diagonal_2}) / 2" | bc)
                echo -e " Menghitung Luas Ketupat"
                echo -e " Rumus = (Diagonal 1 x Diagonal 2) / 2"
                echo -e " Hasil = (${diagonal_1} x ${diagonal_2}) / 2 = ${hasil}"
                echo -ne " Press (enter) to continue !";read enter;
                sleep 0.5
                process_ketupat
                }

              function process_ketupat_keliling() {
                echo -ne " Panjang Sisi Ketupat : "; read sisi
                hasil=$(echo "scale=2; 4 * ${sisi}" | bc)
                echo -e " Menghitung Keliling Ketupat"
                echo -e " Rumus = 4 x Sisi"
                echo -e " Hasil = 4 x ${sisi} = ${hasil}"
                echo -ne " Press (enter) to continue !";read enter;
                sleep 0.5
                process_ketupat
                }

        function process_persegi() {
          echo -e "\n"
          print_centered_banner_box "Persegi"
          echo -e " 1). Menghitung Luas"
          echo -e " 2). Mencari Keliling"
          echo -e " 0). Menu Utama"
          echo -ne " [?] Pilih /menu/persegi : "; read pilih_menu_persegi
          if [[ ${pilih_menu_persegi} =~ ^(00|0)$ ]]; then
            menu
          elif [[ ${pilih_menu_persegi} =~ ^(01|1)$ ]]; then
            process_persegi_luas
          elif [[ ${pilih_menu_persegi} =~ ^(02|2)$ ]]; then
            process_persegi_keliling
          else
          echo -e " Menu Tidak Tersedia Silahkan Pilih Dengan Benar"
          sleep 0.5
          process_persegi
          fi
        }
              # Fungsi untuk menghitung luas persegi
              function process_persegi_luas() {
                echo -ne " Panjang Sisi Persegi : "; read sisi
                hasil=$(echo -e "scale=2; ${sisi} * ${sisi}" | bc)
                echo -e " Menghitung Luas Persegi"
                echo -e " Rumus = Sisi x Sisi"
                echo -e " Hasil = ${sisi} x ${sisi} = ${hasil}"
                echo -ne " Press (enter) to continue !"; read enter;
                sleep 0.5
                process_persegi  # Kembali ke menu persegi
              }

              # Fungsi untuk menghitung keliling persegi
              function process_persegi_keliling() {
                echo -ne " Panjang Sisi Persegi : "; read sisi
                hasil=$(echo -e "scale=2; 4 * ${sisi}" | bc)
                echo -e " Menghitung Keliling Persegi"
                echo -e " Rumus = 4 x Sisi"
                echo -e " Hasil = 4 x ${sisi} = ${hasil}"
                echo -ne " Press (enter) to continue !"; read enter;
                sleep 0.5
                process_persegi  # Kembali ke menu persegi
              }

        function process_segitiga() {
          echo -e "\n"
          print_centered_banner_box "Segitiga"
          echo -e " 1). Menghitung Luas"
          echo -e " 2). Mencari Keliling"
          echo -e " 0). Menu Utama"
          echo -ne " [?] Pilih /menu/segitiga : "; read pilih_menu_segitiga
          if [[ ${pilih_menu_segitiga} =~ ^(00|0)$ ]]; then
            menu
          elif [[ ${pilih_menu_segitiga} =~ ^(01|1)$ ]]; then
            process_segitiga_luas
          elif [[ ${pilih_menu_segitiga} =~ ^(02|2)$ ]]; then
            process_segitiga_keliling
          else
          echo -e " Menu Tidak Tersedia Silahkan Pilih Dengan Benar"
          sleep 0.5
          process_segitiga
          fi
        }
              # Fungsi untuk menghitung luas segitiga
              function process_segitiga_luas() {
                  echo -ne " Alas Segitiga : "; read alas
                  echo -ne " Tinggi Segitiga : "; read tinggi
                  hasil=$(echo "scale=2; 0.5 * ${alas} * ${tinggi}" | bc -l)
                  echo -e " Menghitung Luas Segitiga"
                  echo -e " Rumus = 1/2 x Alas x Tinggi"
                  echo -e " Hasil = 1/2 x ${alas} x ${tinggi} = ${hasil}"
                  echo -ne " Press (enter) to continue !"; read enter;
                  sleep 0.5
                  process_segitiga
              }

              # Fungsi untuk menghitung keliling segitiga
              function process_segitiga_keliling() {
                  echo -ne " Panjang Sisi A : "; read sisi_a
                  echo -ne " Panjang Sisi B : "; read sisi_b
                  echo -ne " Panjang Sisi C : "; read sisi_c
                  hasil=$(echo "scale=2; ${sisi_a} + ${sisi_b} + ${sisi_c}" | bc -l)
                  echo -e " Menghitung Keliling Segitiga"
                  echo -e " Rumus = Sisi A + Sisi B + Sisi C"
                  echo -e " Hasil = ${sisi_a} + ${sisi_b} + ${sisi_c} = ${hasil}"
                  echo -ne " Press (enter) to continue !"; read enter;
                  sleep 0.5
                  process_segitiga
              }


        function process_trapesium() {
          echo -e "\n"
          print_centered_banner_box "Trapesium"
          echo -e " 1). Menghitung Luas"
          echo -e " 2). Mencari Keliling"
          echo -e " 0). Menu Utama"
          echo -ne " [?] Pilih /menu/trapesium : "; read pilih_menu_trapesium
          if [[ ${pilih_menu_trapesium} =~ ^(00|0)$ ]]; then
            menu
          elif [[ ${pilih_menu_trapesium} =~ ^(01|1)$ ]]; then
            process_trapesium_luas
          elif [[ ${pilih_menu_trapesium} =~ ^(02|2)$ ]]; then
            process_trapesium_keliling
          else
          echo -e " Menu Tidak Tersedia Silahkan Pilih Dengan Benar"
          sleep 0.5
          process_trapesium
          fi
        } 

              # Fungsi untuk menghitung luas trapesium
              function process_trapesium_luas() {
                  echo -ne " Panjang Sisi Atas : "; read sisi_atas
                  echo -ne " Panjang Sisi Bawah : "; read sisi_bawah
                  echo -ne " Tinggi Trapesium : "; read tinggi
                  hasil=$(echo "scale=2; (${sisi_atas} + ${sisi_bawah}) * ${tinggi} / 2" | bc)
                  echo -e " Menghitung Luas Trapesium"
                  echo -e " Rumus = (Sisi Atas + Sisi Bawah) * Tinggi / 2"
                  echo -e " Hasil = (${sisi_atas} + ${sisi_bawah}) * ${tinggi} / 2 = ${hasil}"
                  echo -ne " Press (enter) to continue !"; read enter;
                  sleep 0.5
                  process_trapesium
              }

              # Fungsi untuk menghitung keliling trapesium
              function process_trapesium_keliling() {
                  echo -ne " Panjang Sisi Atas : "; read sisi_atas
                  echo -ne " Panjang Sisi Bawah : "; read sisi_bawah
                  echo -ne " Panjang Sisi Kiri : "; read sisi_kiri
                  echo -ne " Panjang Sisi Kanan : "; read sisi_kanan
                  hasil=$(echo "scale=2; ${sisi_atas} + ${sisi_bawah} + ${sisi_kiri} + ${sisi_kanan}" | bc)
                  echo -e " Menghitung Keliling Trapesium"
                  echo -e " Rumus = Sisi Atas + Sisi Bawah + Sisi Kiri + Sisi Kanan"
                  echo -e " Hasil = ${sisi_atas} + ${sisi_bawah} + ${sisi_kiri} + ${sisi_kanan} = ${hasil}"
                  echo -ne " Press (enter) to continue !"; read enter;
                  sleep 0.5
                  process_trapesium
              }

        function process_lingkaran() {
          echo -e "\n"
          print_centered_banner_box "Lingkaran"
          echo -e " 1). Menghitung Luas"
          echo -e " 2). Mencari Keliling"
          echo -e " 0). Menu Utama"
          echo -ne " [?] Pilih /menu/lingkaran : "; read pilih_menu_lingkaran
          if [[ ${pilih_menu_lingkaran} =~ ^(00|0)$ ]]; then
            menu
          elif [[ ${pilih_menu_lingkaran} =~ ^(01|1)$ ]]; then
            process_lingkaran_luas
          elif [[ ${pilih_menu_lingkaran} =~ ^(02|2)$ ]]; then
            process_lingkaran_keliling
          else
          echo -e " Menu Tidak Tersedia Silahkan Pilih Dengan Benar"
          sleep 0.5
          process_lingkaran
          fi
        }

              # Fungsi untuk menghitung luas lingkaran
              function process_lingkaran_luas() {
                  echo -ne " Jari-jari Lingkaran : "; read jari_jari
                  hasil=$(echo "scale=2; 3.14159265359 * (${jari_jari}^2)" | bc)
                  echo -e " Menghitung Luas Lingkaran"
                  echo -e " Rumus = π * r^2"
                  echo -e " Hasil = 3.14159265359 * (${jari_jari}^2) = ${hasil}"
                  echo -ne " Press (enter) to continue !"; read enter;
                  sleep 0.5
                  process_lingkaran
              }

              # Fungsi untuk menghitung keliling lingkaran
              function process_lingkaran_keliling() {
                  echo -ne " Jari-jari Lingkaran : "; read jari_jari
                  hasil=$(echo "scale=2; 2 * 3.14159265359 * ${jari_jari}" | bc)
                  echo -e " Menghitung Keliling Lingkaran"
                  echo -e " Rumus = 2 * π * r"
                  echo -e " Hasil = 2 * 3.14159265359 * ${jari_jari} = ${hasil}"
                  echo -ne " Press (enter) to continue !"; read enter;
                  sleep 0.5
                  process_lingkaran  # Kembali ke menu utama setelah perhitungan
              }

        function process_jajar_genjang() {
          echo -e "\n"
          print_centered_banner_box "Jajargenjang"
          echo -e " 1). Menghitung Luas"
          echo -e " 2). Mencari Keliling"
          echo -e " 0). Menu Utama"
          echo -ne " [?] Pilih /menu/jajar_genjang : "; read pilih_menu_jajar_genjang
          if [[ ${pilih_menu_jajar_genjang} =~ ^(00|0)$ ]]; then
            menu
          elif [[ ${pilih_menu_jajar_genjang} =~ ^(01|1)$ ]]; then
            process_jajar_genjang_luas
          elif [[ ${pilih_menu_jajar_genjang} =~ ^(02|2)$ ]]; then
            process_jajar_genjang_keliling
          else
          echo -e " Menu Tidak Tersedia Silahkan Pilih Dengan Benar"
          sleep 0.5
          process_jajar_genjang
          fi
        }
              # Fungsi untuk menghitung luas jajar genjang
              function process_jajar_genjang_luas() {
                  echo -ne " Panjang Alas : "; read alas
                  echo -ne " Tinggi : "; read tinggi
                  hasil=$(echo "scale=2; ${alas} * ${tinggi}" | bc)
                  echo -e " Menghitung Luas Jajar Genjang"
                  echo -e " Rumus = Alas x Tinggi"
                  echo -e " Hasil = ${alas} x ${tinggi} = ${hasil}"
                  echo -ne " Press (enter) to continue !"; read enter;
                  sleep 0.5
                  process_jajar_genjang  # Kembali ke menu utama setelah perhitungan
              }

              # Fungsi untuk menghitung keliling jajar genjang
              function process_jajar_genjang_keliling() {
                  echo -ne " Panjang Sisi 1 : "; read sisi1
                  echo -ne " Panjang Sisi 2 : "; read sisi2
                  hasil=$(echo "scale=2; 2 * (${sisi1} + ${sisi2})" | bc)
                  echo -e " Menghitung Keliling Jajar Genjang"
                  echo -e " Rumus = 2 * (Sisi 1 + Sisi 2)"
                  echo -e " Hasil = 2 * (${sisi1} + ${sisi2}) = ${hasil}"
                  echo -ne " Press (enter) to continue !"; read enter;
                  sleep 0.5
                  process_jajar_genjang  # Kembali ke menu utama setelah perhitungan
              }

        function process_layang_layang() {
          echo -e "\n"
          print_centered_banner_box "Layang-Layang"
          echo -e " 1). Menghitung Luas"
          echo -e " 2). Mencari Keliling"
          echo -e " 0). Menu Utama"
          echo -ne " [?] Pilih /menu/layang_layang : "; read pilih_menu_layang_layang
          if [[ ${pilih_menu_layang_layang} =~ ^(00|0)$ ]]; then
            menu
          elif [[ ${pilih_menu_layang_layang} =~ ^(01|1)$ ]]; then
            process_layang_layang_luas
          elif [[ ${pilih_menu_layang_layang} =~ ^(02|2)$ ]]; then
            process_layang_layang_keliling
          else
          echo -e " Menu Tidak Tersedia Silahkan Pilih Dengan Benar"
          sleep 0.5
          process_layang_layang
          fi
        } 
              # Fungsi untuk menghitung luas layang-layang
              function process_layang_layang_luas() {
                  echo -ne " Panjang Diagonal 1 : "; read diagonal1
                  echo -ne " Panjang Diagonal 2 : "; read diagonal2
                  hasil=$(echo "scale=2; (${diagonal1} * ${diagonal2}) / 2" | bc)
                  echo -e " Menghitung Luas Layang-Layang"
                  echo -e " Rumus = (Diagonal 1 x Diagonal 2) / 2"
                  echo -e " Hasil = (${diagonal1} x ${diagonal2}) / 2 = ${hasil}"
                  echo -ne " Press (enter) to continue !"; read enter;\
                  sleep 0.5
                  process_layang_layang  # Kembali ke menu utama setelah perhitungan
              }

              # Fungsi untuk menghitung keliling layang-layang
              function process_layang_layang_keliling() {
                  echo -ne " Panjang Diagonal 1 : "; read diagonal1
                  echo -ne " Panjang Diagonal 2 : "; read diagonal2
                  hasil=$(echo "scale=2; 2 * (${diagonal1} + ${diagonal2})" | bc)
                  echo -e " Menghitung Keliling Layang-Layang"
                  echo -e " Rumus = 2 * (Diagonal 1 + Diagonal 2)"
                  echo -e " Hasil = 2 * (${diagonal1} + ${diagonal2}) = ${hasil}"
                  echo -ne " Press (enter) to continue !"; read enter;
                  sleep 0.5
                  process_layang_layang  # Kembali ke menu utama setelah perhitungan
              }

        function process_persegi_panjang() {
          echo -e "\n"
          print_centered_banner_box "Persegi-Panjang"
          echo -e " 1). Menghitung Luas"
          echo -e " 2). Mencari Keliling"
          echo -e " 0). Menu Utama"
          echo -ne " [?] Pilih /menu/persegi_panjang : "; read pilih_menu_persegi_panjang
          if [[ ${pilih_menu_persegi_panjang} =~ ^(00|0)$ ]]; then
            menu
          elif [[ ${pilih_menu_persegi_panjang} =~ ^(01|1)$ ]]; then
            process_persegi_panjang_luas
          elif [[ ${pilih_menu_persegi_panjang} =~ ^(02|2)$ ]]; then
            process_persegi_panjang_keliling
          else
          echo -e " Menu Tidak Tersedia Silahkan Pilih Dengan Benar"
          sleep 0.5
          process_persegi_panjang
          fi
        }

            # Fungsi untuk menghitung keliling persegi panjang
            function process_persegi_panjang_keliling() {
                echo -ne " Panjang : "; read panjang
                echo -ne " Lebar : "; read lebar
                hasil=$(echo "scale=2; 2 * (${panjang} + ${lebar})" | bc)
                echo -e " Menghitung Keliling Persegi Panjang"
                echo -e " Rumus = 2 * (Panjang + Lebar)"
                echo -e " Hasil = 2 * (${panjang} + ${lebar}) = ${hasil}"
                echo -ne " Press (enter) to continue !"; read enter;
                sleep 0.5
                process_persegi_panjang  # Kembali ke menu utama setelah perhitungan
            }

            # Fungsi untuk menghitung luas persegi panjang
            function process_persegi_panjang_luas() {
                echo -ne " Panjang : "; read panjang
                echo -ne " Lebar : "; read lebar
                hasil=$(echo "scale=2; ${panjang} * ${lebar}" | bc)
                echo -e " Menghitung Luas Persegi Panjang"
                echo -e " Rumus = Panjang x Lebar"
                echo -e " Hasil = ${panjang} x ${lebar} = ${hasil}"
                echo -ne " Press (enter) to continue !"; read enter;
                sleep 0.5
                process_persegi_panjang  # Kembali ke menu utama setelah perhitungan
            }

menu
