import '../models/nasabah.dart';
import '../models/deposito.dart';
import '../models/pinjaman.dart'; // pastikan ini ada

Nasabah nasabahDummy = Nasabah(
  nama: "Amelia Rizky Yuniar",
  saldo: 5000000,
  histori: [],
  historiBayar: [],
  daftarDeposito: [],
  daftarPinjaman: [], // ✅ yang benar
);

void tambahPengajuanPinjaman(PengajuanPinjaman pinjaman) {
  nasabahDummy.daftarPinjaman.add(pinjaman); // ✅ akses ke dalam objek
}
