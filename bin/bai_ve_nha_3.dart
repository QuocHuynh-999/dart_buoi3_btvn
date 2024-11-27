// Xây dựng một ứng dụng để quản lý các nhân viên trong công ty, bao gồm nhân viên
// văn phòng và nhân viên kỹ thuật. Mỗi loại nhân viên có những đặc điểm và nhiệm vụ khác nhau.

abstract class Employee {
  // Abstract class Employee
  String name;
  String id;

  Employee(this.name, this.id); // Constructorn Employee

  void printInfo() {
    // Hàm in ra thông tin cơ bản về nhân viên
    print('Name: $name, Id: $id');
  }

  double calculateSalary(); // Hàm tính toán và trả về lương của nhân viên
}

abstract class Workable {
  // Interface Workable
  void doWork();
}

class OfficeWorker extends Employee implements Workable {
  // Class OfficeWorker kế thừa từ Employee và thực hiện interface Workable

  String department; //  thêm thuộc tính department (phòng ban).

  OfficeWorker(String id, String name, this.department) : super(id, name); // Phải có cái ni
  // Đây là constructor của lớp OfficeWorker. Nó nhận ba tham số: id, name, và department.
  // Thuộc tính department được khởi tạo trực tiếp trong constructor bằng cách sử dụng từ khóa this.
  // super(id, name) gọi constructor của lớp cha Employee.
  // Điều này có nghĩa là nó truyền hai tham số id và name lên lớp cha Employee để khởi tạo các thuộc tính id và name trong lớp cha.

  @override
  void doWork() {
    // Hàm in ra thông tin cơ bản về nhân viên
    print('$name is working in the $department department.');
  }

  @override
  double calculateSalary() {
    // override lại từ lớp Employee
    // Tính toán lương cho OfficeWorker
    return 300000;
  }
}

class TechWorker extends Employee implements Workable {
  // Class TechWorker kế thừa từ Employee và thực hiện interface Workable
  String field; // thêm thuộc tính field (lĩnh vực kỹ thuật)

  TechWorker(String id, String name, this.field)
      : super(id, name); // Phải có cái ni
  // Đây là constructor của lớp TechWorker. Nó nhận ba tham số: id, name, và field.
  // Thuộc tính field được khởi tạo trực tiếp trong constructor bằng cách sử dụng từ khóa this.
  // super(id, name) gọi constructor của lớp cha Employee.
  // Điều này có nghĩa là nó truyền hai tham số id và name lên lớp cha Employee để khởi tạo các thuộc tính id và name trong lớp cha.

  @override
  void doWork() {
    // override lại từ lớp Employee
    // Hàm in ra thông tin cơ bản về nhân viên
    print('$name is working in the field of $field.');
  }

  @override
  double calculateSalary() {
    // override lại từ lớp Employee
    // Tính toán lương cho OfficeWorker
    return 400000;
  }
}

class Company {
  List<Employee> emloyees =
      []; // Đây là cách khai báo một danh sách (List) trong Dart.
  // List là một cấu trúc dữ liệu chứa một tập hợp các phần tử có cùng kiểu,
  // trong trường hợp này là các đối tượng kiểu Employee
  // Dấu bằng (=) gán giá trị cho danh sách employees.
  // [] là một danh sách rỗng. Nó chỉ ra rằng khi khởi tạo, danh sách này không chứa bất kỳ phần tử nào.

  void addEmployee(Employee emloyee) {
    // Hàm thêm nhân viên
    emloyees.add(emloyee);
  }

  void printAllEmployees() {
    // Hàm in ra tất cả nhân viên
    for (var employee in emloyees) {
      employee.printInfo();
    }
  }

  double getTotalSalary() {
    // Tính tổng lương
    double sum = 0;
    for (var emloyee in emloyees) {
      sum += emloyee.calculateSalary();
    }
    return sum;
  }
}

void main() {
  var company = Company();
  company.addEmployee(OfficeWorker('001', 'Alice', 'HR')); // Thêm nhân viên
  company.addEmployee( TechWorker('002', 'Bob', 'Software Development')); // Thêm nhân viên

  company.printAllEmployees(); // in ra tất cả nhân viên

  print('Total Salary: \$${company.getTotalSalary()}'); // Tính tổng
  ////////////////////////////////////////////////////
}
