# Database & PL/pgSQL Tasks
### Complete SQL + PL/pgSQL Solutions for Real-World Scenarios

This repository contains 3 complete modules:

---

# 📦 Modules

### **1️⃣ Student & Marks Management**
- Normalized database schema  
- Aggregated totals & percentage calculation  
- Dynamic student search  
- Case-insensitive search using `ILIKE`  

### **2️⃣ Order Management Using JSON Inputs**
- Order + order_items schema  
- Insert header + details using JSONB  
- Return order ID + total value  

### **3️⃣ Inventory Transaction System**
- Inventory master table  
- UPSERT via JSONB  
- List items as JSON  
- Unique SKU conflict handling  

---

# 🚀 Quick Start

### 1. Initialize the DB
```bash
psql -f schema/student_marks.sql
psql -f schema/orders.sql
psql -f schema/inventory.sql
