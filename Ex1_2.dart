// ============================================================================
// Bài tập: Quản lý nhân viên với Mixin & Spread Operator
// Vị trí: work/On_Class/Ex1/Ex1_2.dart
// ============================================================================

abstract class Employee {
  String name;
  Employee(this.name);
  void work();
}

// TODO 1: Khai báo mixin CheckInAbility giới hạn cho Employee
// Từ khóa 'on Employee' đảm bảo mixin chỉ áp dụng được cho lớp con của Employee
mixin CheckInAbility on Employee {
  void checkIn() {
    print('$name đã điểm danh');
  }
}

// TODO 2: Tích hợp mixin CheckInAbility vào class này bằng từ khóa 'with'
class Developer extends Employee with CheckInAbility {
  Developer(String name) : super(name);

  @override
  void work() => print("$name đang viết code.");
}

void main() {
  List<Developer> teamA = [Developer("An"), Developer("Bình")];
  List<Developer> teamB = [Developer("Cường")];

  // TODO 3: Dùng Spread Operator (...) để gộp teamA và teamB vào allStaff
  List<Developer> allStaff = [...teamA, ...teamB];

  // TODO 4: Dùng vòng lặp gọi hàm checkIn() cho tất cả nhân sự trong allStaff
  print('=== DANH SÁCH ĐIỂM DANH NHÂN VIÊN ===');
  for (Developer staff in allStaff) {
    staff.checkIn();
  }
}

