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


---

## 📸 App Screenshots

### 🟦 Login Page

![Login Page](https://drive.google.com/uc?export=view&id=1q0w2bxwY42QMx8T-n48TQI2WkTgh4B08)

---

### 🟩 Home Page

![Home Page](https://drive.google.com/uc?export=view&id=1w6LVUZdZLQs86Ak0Y9CIruSa1eelCF3V)

---

### 🟨 Logout Action

![Profile Page](https://drive.google.com/uc?export=view&id=1doHpSr92yZjW3wO3_AHRhV3l3Ok5CxFa)





