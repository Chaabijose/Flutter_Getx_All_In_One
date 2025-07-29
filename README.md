# Flutter GetX Authentication Example

A complete Flutter authentication example built with **GetX** following a clean and well-structured folder architecture.

---

## 📖 Description

This project demonstrates how to implement a full authentication flow in Flutter using **GetX** for state management, navigation, and dependency injection. It follows best practices for code organization and service separation while providing a simple and scalable example you can adapt to your needs.

---

## 🚀 Features

### Services & Persistence
- **StorageService**: Persistent storage management with `GetStorage`.
- **UserService**: Reactive user state management and session persistence.

### Authentication
- **LoginController**: Input validation, state management using `obs` and `Obx`.
- **LoginPage**: A sleek login UI built entirely with GetX, no scaffold used.
- **Automatic user data persistence** after login.

### Navigation & Routing
- GetX routing with automatic bindings.
- Smart redirection depending on login status.
- Clean navigation using `Get.offAllNamed()`.

### Best Practices Applied
- Professional naming conventions: `snake_case` for files, `camelCase` for variables.
- Proper use of `GetBuilder`, `Obx`, and reactive `obs`.
- Clean dependency injection with Bindings.
- Persistent services (`UserService`, `StorageService`).
- Clear separation of concerns: controllers, services, models.

---

### 📸 Folder Structure Screenshot

![Folder Structure](https://drive.google.com/uc?export=view&id=1csVjt2BFZTIIIsLn_bKzHInNU9GayZ9J)




