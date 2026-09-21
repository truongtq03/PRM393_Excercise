// ============================================================================
// Bài tập: Thiết kế hệ thống phương tiện giao thông (OOP & Kế thừa)
// Vị trí: work/On_Class/Ex1/Ex1_1.dart
// ============================================================================

// TODO 1: Định nghĩa class Vehicle với các thuộc tính String brand, int year.
// Viết Default constructor và hàm void startEngine().
class Vehicle {
  String brand;
  int year;

  // Default constructor
  Vehicle(this.brand, this.year);

  // Phương thức khởi động phương tiện
  void startEngine() {
    print('Khởi động phương tiện...');
  }
}

// TODO 2: Định nghĩa class Car kế thừa từ Vehicle.
// Thêm thuộc tính bool isElectric.
class Car extends Vehicle {
  bool isElectric;

  // TODO 3: Viết constructor mặc định cho Car (dùng super để truyền brand và year).
  Car(String brand, int year, this.isElectric) : super(brand, year);

  // Viết Named Constructor: Car.tesla(int year) thiết lập sẵn brand="Tesla" và isElectric=true.
  Car.tesla(int year)
      : isElectric = true,
        super('Tesla', year);

  // TODO 4: Ghi đè (@override) hàm startEngine() để in ra thông báo chi tiết hơn.
  @override
  void startEngine() {
    if (isElectric) {
      print('[$brand - Đời $year]: Khởi động êm ái, động cơ điện không tiếng ồn! ⚡');
    } else {
      print('[$brand - Đời $year]: Động cơ xăng gầm rú: Vroom... Vroom! 🚗💨');
    }
  }
}

void main() {
  print('=== KIỂM TRA HỆ THỐNG PHƯƠNG TIỆN GIAO THÔNG ===\n');

  // TODO 5: Khởi tạo một xe Car bình thường và gọi startEngine()
  Car normalCar = Car('Toyota Vios', 2021, false);
  print('--- 1. Xe ô tô thông thường (xe xăng) ---');
  print('Hãng: ${normalCar.brand}, Năm SX: ${normalCar.year}, Là xe điện: ${normalCar.isElectric}');
  normalCar.startEngine();

  print(''); // Dòng trống phân cách

  // TODO 6: Khởi tạo một xe Car bằng Named Constructor (Car.tesla) và gọi startEngine()
  Car teslaCar = Car.tesla(2024);
  print('--- 2. Xe Tesla (Named Constructor) ---');
  print('Hãng: ${teslaCar.brand}, Năm SX: ${teslaCar.year}, Là xe điện: ${teslaCar.isElectric}');
  teslaCar.startEngine();
}
