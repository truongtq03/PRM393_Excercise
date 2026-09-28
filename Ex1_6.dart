// ============================================================================
// Ex 1.6: Xử lý Null Safety và Khởi tạo an toàn (Factory Constructor)
// ============================================================================

class User {
  int id;
  String name;
  
  // TODO 1: Khai báo biến email có thể mang giá trị null (nullable variable)
  String? email;

  // Constructor
  User({required this.id, required this.name, this.email});

  // TODO 2: Khai báo factory User.fromJson(Map<String, dynamic> json)
  // - Lấy id từ json['id']
  // - Lấy name từ json['name']. Nếu null, dùng toán tử ?? để gán mặc định là "Khách"
  // - Lấy email từ json['email']
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: (json['name'] as String?) ?? 'Khách',
      email: json['email'] as String?,
    );
  }

  void showProfile() {
    // TODO 3: In ra thông tin. Dùng toán tử ?? để xử lý email nếu bị null.
    // Gợi ý chuỗi in ra: "ID: $id | Tên: $name | Email: ..."
    String displayEmail = email ?? 'Chưa cập nhật';
    print('ID: $id | Tên: $name | Email: $displayEmail');
  }
}

void main() {
  print('=== KIỂM THỬ KHỞI TẠO USER TỪ DỮ LIỆU JSON ===\n');

  // Giả lập dữ liệu JSON trả về từ API
  Map<String, dynamic> rawData1 = {
    "id": 1,
    "name": "Nam",
    "email": "nam@fpt.edu.vn"
  };
  
  Map<String, dynamic> rawData2 = {
    "id": 2,
    "name": null,
    "email": null
  };

  // TODO 4: Khởi tạo user1 và user2 từ 2 Map trên bằng User.fromJson() và gọi showProfile()
  User user1 = User.fromJson(rawData1);
  User user2 = User.fromJson(rawData2);

  print('--- Thông tin User 1 (Đầy đủ dữ liệu) ---');
  user1.showProfile();

  print('\n--- Thông tin User 2 (Có trường bị null) ---');
  user2.showProfile();
}