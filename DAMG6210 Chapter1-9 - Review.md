# DAMG 6210 复习资料：Chapters 1-9 重点总结

**课程**: Data Management and Database Desig
**教材**: Modern Database Management (10th Edition) by Hoffer

---

## 目录 Table of Contents

- [Chapter 1: The Database Environment and Development Process](#chapter-1-the-database-environment-and-development-process)
- [Chapter 2: Modeling Data in the Organization](#chapter-2-modeling-data-in-the-organization)
- [Chapter 3: The Enhanced E-R Model (EER)](#chapter-3-the-enhanced-e-r-model-eer)
- [Chapter 4: Logical Database Design and the Relational Model](#chapter-4-logical-database-design-and-the-relational-model)
- [Chapter 5: Physical Database Design and Performance](#chapter-5-physical-database-design-and-performance)
- [Chapter 6: Introduction to SQL](#chapter-6-introduction-to-sql)
- [Chapter 7: Advanced SQL](#chapter-7-advanced-sql)
- [Chapter 8: Database Application Development](#chapter-8-database-application-development)
- [Chapter 9: Data Warehousing](#chapter-9-data-warehousing)
- [Use Case Diagram & Class Diagram](#use-case-diagram--class-diagram)

---

## Chapter 1: The Database Environment and Development Process

### 核心概念 Core Concepts

#### 1. Data vs. Information

**Data（数据）**: Raw facts about people, places, objects, events, or concepts

**Information（信息）**: Data processed to be useful; provides meaning to users (数据经过处理后变得有用，为用户提供意义)

#### 2. Metadata（元数据）

**Definition**: Data that describe the properties or characteristics of end-user data and the context of those data

**本质**: "Data about data" - 描述数据属性和上下文的数据

Includes: data names, definitions, length, allowable values, source, ownership

#### 3. Database（数据库）

An organized collection of **logically related data**

Designed for easy access, retrieval, and use

#### 4. Database Management System (DBMS)

Software system that manages and controls access to the database

Functions: Define, create, maintain, and provide controlled access to data

---

### 传统文件处理系统的缺点 Disadvantages of File Processing Systems

#### Program-Data Dependence（程序-数据依赖）

- File structure is defined in application programs
- Changes require modifying all programs

#### Duplication of Data（数据重复）

- Same data stored in multiple files
- Wastes storage space; causes inconsistency

#### Limited Data Sharing（有限的数据共享）

- Each application has private files
- Difficult to share data across departments

#### Lengthy Development Times（开发时间长）

- Each new application starts from scratch

#### Excessive Program Maintenance（过度的程序维护）

- Up to 80% of IS budget on maintenance

---

### 数据库方法的优势 Advantages of Database Approach

1. **Program-Data Independence（程序-数据独立性）**: Metadata stored separately from application programs
2. **Planned Data Redundancy（有计划的数据冗余）**: Controlled redundancy for performance
3. **Improved Data Consistency（改善的数据一致性）**: Reduced redundancy = better consistency
4. **Improved Data Sharing（改善的数据共享）**: Data available across applications
5. **Increased Productivity（提高生产力）**: Less time on low-level details
6. **Enforcement of Standards（标准的强制执行）**: Consistent naming, formats
7. **Improved Data Quality（改善的数据质量）**: Centralized control
8. **Improved Data Accessibility（改善的数据可访问性）**: Query languages
9. **Reduced Program Maintenance（减少的程序维护）**: Data independence
10. **Improved Decision Support（改善的决策支持）**: Access to accurate, timely data

---

### 数据库方法的成本和风险 Costs and Risks

- New specialized personnel (DBAs, data analysts)
- Installation and management complexity
- Conversion costs
- Need for explicit backup and recovery
- Organizational conflict

---

### 数据库环境的组成部分 Components of Database Environment

1. **Users**: Database administrators, designers, developers, end users
2. **DBMS**: Software for database management
3. **Database**: Collection of logically related data
4. **Repository**: Centralized storehouse of metadata
5. **Application Programs**: Software using/processing the data
6. **Hardware**: Physical devices
7. **User Interface**: Screens, forms, reports
8. **Data/Database Administrators**: People who manage the data resource
9. **Procedures**: Instructions for using the system

---

### 数据库应用的范围 Range of Database Applications

#### Personal Databases

Single-user, desktop applications

#### Two-Tier Client/Server

- **Client**: user interface and application logic
- **Server**: DBMS and database

#### Multitier Client/Server (Three-Tier Architecture)

- **Presentation tier**: User interface
- **Application tier**: Business logic
- **Database tier**: Data storage and management

#### Enterprise Applications

- **ERP (Enterprise Resource Planning) Systems**: Integrate business processes
- **Data Warehouses**: Subject-oriented, integrated, time-variant, nonvolatile collections of data

---

### 数据库开发过程 Database Development Process

#### Systems Development Life Cycle (SDLC) Phases:

1. **Planning**: Enterprise modeling, conceptual data modeling
2. **Analysis**: Detailed conceptual data modeling, requirements gathering
3. **Design**:
   - Logical database design (mapping to relational model)
   - Physical database design (storage specifications)
4. **Implementation**: Database creation, loading, testing
5. **Maintenance**: Database evolution, tuning, monitoring

#### Alternative Methodologies:

- **Prototyping（原型法）**: Rapid iterative development
- **Agile Development（敏捷开发）**: Adaptive, flexible, collaborative

---

### 三层模式架构 Three-Schema Architecture

1. **External Schema (User Views)**: Individual user or group perspectives
2. **Conceptual Schema（概念模式）**: Integrated view of entire database
3. **Internal Schema (Physical Schema)**: How data are physically stored

---

## Chapter 2: Modeling Data in the Organization

### 业务规则 Business Rules

**Definition**: Statements that define or constrain some aspect of the business

Derived from policies, procedures, events, functions

Types: **Facts（事实）** and **Terms（术语）**

#### Sources of Business Rules:

- Mission statements, policies
- Interviews with managers
- Forms, reports, existing systems
- Regulations, contracts

---

### 实体-关系模型 Entity-Relationship (E-R) Model

#### Entity（实体）

A person, place, object, event, or concept about which information must be recorded and retained

- **Entity Type（实体类型）**: Collection of entities sharing common properties
- **Entity Instance（实体实例）**: Single occurrence of an entity type

#### Strong Entity Type（强实体类型）

- Exists independently of other entities
- Has its own unique identifier
- Examples: STUDENT, EMPLOYEE, PRODUCT

#### Weak Entity Type（弱实体类型）

- Existence depends on another entity (owner)
- Lacks complete identifier
- Uses partial identifier + owner's identifier
- Represented with **double-line rectangle**
- Connected via **Identifying Relationship（标识性关系）** (double-line diamond)
- Example: DEPENDENT depends on EMPLOYEE

---

### 属性 Attributes

#### Required Attribute（必需属性）

Must have a value for every instance

#### Optional Attribute（可选属性）

May not have a value (can be NULL)

#### Simple (Atomic) Attribute（简单属性）

Cannot be broken down

- Example: Age

#### Composite Attribute（复合属性）

Can be decomposed into component parts

- Example: Address = (Street, City, State, Zip)

#### Multivalued Attribute（多值属性）

May have multiple values for a single instance

- Represented with **double-line ellipse**
- Example: College Degree, Skills

#### Derived Attribute（派生属性）

Value calculated from other attributes

- Represented with **dashed ellipse**
- Example: Age (derived from Date of Birth)

#### Identifier（标识符）

Attribute(s) that uniquely identify entity instances

- **Underlined** in E-R diagrams
- Must be unique, non-null, stable
- **Composite Identifier（复合标识符）**: Multiple attributes needed for uniqueness
  - Example: (StudentID, CourseID) for ENROLLMENT

---

### 关系 Relationships

**Relationship Type（关系类型）**: Meaningful association among entity types

**Relationship Instance（关系实例）**: Association among entity instances

#### Degree of Relationship（关系的度）

##### 1. Unary Relationship (Degree = 1)（一元关系）

- Relates an entity to itself
- Also called **Recursive Relationship**
- Example: EMPLOYEE Supervises EMPLOYEE

##### 2. Binary Relationship (Degree = 2)（二元关系）

- Between two entity types (most common)
- Example: CUSTOMER Places ORDER

##### 3. Ternary Relationship (Degree = 3)（三元关系）

- Among three entity types
- Example: VENDOR Supplies PART to WAREHOUSE
- Often converted to associative entity

---

### 关联实体 Associative Entity

#### When to Use:

- Many-to-many relationship with attributes
- Many-to-many that needs to relate to other entities
- Ternary or higher degree relationships

#### Characteristics:

- Represented with **rounded-corner rectangle**
- Has its own identifier OR composite identifier from related entities
- Example: ENROLLMENT associates STUDENT and COURSE

---

### 基数约束 Cardinality Constraints

#### Minimum Cardinality（最小基数）

Minimum number of instances that must participate

- **0 = Optional participation（可选参与）**
- **1 = Mandatory participation（强制参与）**

#### Maximum Cardinality（最大基数）

Maximum number of instances that can participate

- **1 = One**
- **Many (M or N)**

#### Common Relationship Types:

- **One-to-One (1:1)**: Each instance relates to at most one instance
- **One-to-Many (1:M)**: One instance relates to many instances
- **Many-to-Many (M:N)**: Many instances relate to many instances

#### Notation:

Crow's Foot: Uses symbols at relationship ends

- Minimum: | (one) or O (zero)
- Maximum: | (one) or < (many)

---

### 时间相关数据 Time-Dependent Data

**Time Stamp（时间戳）**:

- Attribute capturing date/time of data value
- Used for historical tracking
- Examples: EffectiveDate, EndDate, TransactionDate

#### Approaches:

1. Multivalued attributes with time stamps
2. Separate entity instances with time stamps
3. Multiple relationships for different time periods

---

## Chapter 3: The Enhanced E-R Model (EER)

### 泛化和特化 Generalization and Specialization

#### Supertype（超类型）

- Generic entity type containing common attributes
- Parent in supertype/subtype relationship
- Example: EMPLOYEE

#### Subtype（子类型）

- Subset of supertype with distinct attributes/relationships
- Child in supertype/subtype relationship
- Inherits all attributes from supertype
- Example: HOURLY_EMPLOYEE, SALARIED_EMPLOYEE

#### Attribute Inheritance（属性继承）

- Subtypes automatically inherit supertype attributes
- Subtypes can have their own unique attributes

#### When to Use Supertypes/Subtypes:

- Subtype has attributes not applicable to supertype
- Subtype participates in relationships not applicable to supertype
- Multiple subtypes exist with different characteristics

---

### 特化 Specialization

**Top-Down Approach**:

- Start with supertype
- Define subtypes as specialized versions
- Example: PART → PURCHASED_PART, MANUFACTURED_PART

---

### 泛化 Generalization

**Bottom-Up Approach**:

- Start with entity types
- Recognize common attributes
- Create supertype to contain commonalities
- Example: CAR, TRUCK → VEHICLE

---

### 超类型/子类型约束 Supertype/Subtype Constraints

#### 1. Completeness Constraint（完整性约束）

##### Total Specialization Rule（全特化规则）

- **Every** supertype instance **must** belong to at least one subtype
- Represented with **double line** from supertype to circle
- Example: Every EMPLOYEE must be either HOURLY or SALARIED

##### Partial Specialization Rule（部分特化规则）

- Supertype instance **may or may not** belong to a subtype
- Represented with **single line** from supertype to circle
- Example: A STUDENT may or may not be an ATHLETE

---

#### 2. Disjointness Constraint（不相交约束）

##### Disjoint Rule（不相交规则）

- Instance can belong to **only ONE** subtype
- Represented with **"d"** in circle
- Subtypes are mutually exclusive
- Example: EMPLOYEE is either HOURLY **or** SALARIED (not both)

##### Overlap Rule（重叠规则）

- Instance can belong to **MORE THAN ONE** subtype simultaneously
- Represented with **"o"** in circle
- Subtypes can overlap
- Example: STUDENT can be both GRADUATE **and** INTERNATIONAL

---

#### Notation Summary:

- **Single line + "d"**: Partial, Disjoint
- **Single line + "o"**: Partial, Overlapping
- **Double line + "d"**: Total, Disjoint
- **Double line + "o"**: Total, Overlapping

#### Subtype Discriminator（子类型判别器）

- Attribute of supertype that determines subtype membership
- Used when disjoint rule applies
- Example: EmployeeType determines if HOURLY or SALARIED

---

### 实体聚类 Entity Cluster

#### Purpose:

- Abstract a set of entities and relationships into **single, higher-level entity**
- Simplifies complex E-R diagrams
- Used when diagram has many entities

#### Benefits:

- Reduces diagram complexity
- Highlights major components
- Facilitates communication with users

#### Representation:

- Shown as entity with internal entities/relationships
- Used in high-level views

---

### 预定义数据模型 Packaged Data Models

**Universal Data Models**:

- Industry-specific or function-specific templates
- Speed development by providing standard patterns
- Examples: Healthcare data models, Financial services models

#### Benefits:

- Faster development using proven structures
- Consistent with industry standards
- Reduced design effort

---

## Chapter 4: Logical Database Design and the Relational Model

### 关系模型基础 Relational Model Basics

#### Relation（关系）

- Named, two-dimensional table of data
- Table = Relation = Entity implemented in database
- Must follow specific properties

#### Key Properties of Relations:

1. **Unique row names**: Each row is unique (no duplicate rows)
2. **Atomic values**: Entries in cells are single-valued (no repeating groups)
3. **Unique column names**: Each column has a distinct name
4. **Column values from same domain**: All values in a column are of same data type
5. **Order independence**: Order of rows and columns doesn't matter
6. **No duplicate rows**: Primary key ensures uniqueness

---

### 关键术语 Key Terminology

#### Primary Key（主键）

- Attribute(s) that uniquely identifies each row
- **Cannot be NULL**
- Must be unique, stable, minimal

#### Candidate Key（候选键）

- Attribute(s) that **could** serve as primary key
- Multiple candidate keys may exist
- One is chosen as primary key

#### Foreign Key（外键）

- Attribute in one relation that references primary key of another relation
- Implements relationships between tables
- **Can be NULL** (unless specified otherwise)
- Example: CustomerID in ORDER table references CUSTOMER table

#### Composite Key（复合键）

- Primary key composed of multiple attributes
- Example: (OrderID, ProductID) in ORDER_LINE

#### Surrogate Key（代理键）

- System-generated unique identifier
- **Non-intelligent**: Has no business meaning
- Example: Auto-incrementing integer
- Benefits: Stable, always unique, simple

#### Enterprise Key（企业键）

- **Single-attribute, non-intelligent** key
- Unique across entire enterprise
- Preferred for large-scale databases
- Ensures global uniqueness

---

### 完整性约束 Integrity Constraints

#### Entity Integrity Rule（实体完整性规则）

- **No primary key attribute can be NULL**
- Ensures each entity is uniquely identifiable

#### Referential Integrity Constraint（参照完整性约束）

- Foreign key must either:
  - Match a primary key value in parent table, **OR**
  - Be NULL (if allowed)
- Prevents "orphaned" records
- Example: Cannot add ORDER with non-existent CustomerID

---

### EER 到关系的转换 Transforming EER Diagrams into Relations

#### Step 1: Map Regular Entities（映射常规实体）

- Create one relation for each entity
- Entity name becomes table name
- Simple attributes become columns
- Identifier becomes primary key
- **Composite attributes**: Include only simple components
- Example: Address (Street, City, State) → Three separate columns

---

#### Step 2: Map Weak Entities（映射弱实体）

- Create relation for weak entity
- Include all attributes of weak entity
- Add **foreign key** from owner entity
- Primary key = **Partial identifier + Owner's primary key**
- Example: DEPENDENT (EmployeeID, DependentName, ...)
  - PK: (EmployeeID, DependentName)
  - FK: EmployeeID references EMPLOYEE

---

#### Step 3: Map Binary Relationships（映射二元关系）

##### One-to-Many (1:M)

- Add foreign key to **"many" side** table
- Foreign key references **"one" side** primary key
- Example: CUSTOMER (1) – Places – (M) ORDER
  - Add CustomerID as FK in ORDER table

##### Many-to-Many (M:N)

- Create **new relation** (associative entity)
- Include **foreign keys from both** entities
- Primary key = **Composite of both foreign keys**
- Include any attributes of the relationship
- Example: STUDENT – Enrolls – COURSE
  - Create ENROLLMENT (StudentID, CourseID, Grade)
  - PK: (StudentID, CourseID)

##### One-to-One (1:1)

- Add foreign key to **either** side (typically to side with mandatory participation)
- OR merge into single table if appropriate

---

#### Step 4: Map Associative Entities（映射关联实体）

- Same as many-to-many
- If associative entity has **own identifier**: Use it as primary key
- Otherwise: Composite key from related entities
- Include all attributes of associative entity

---

#### Step 5: Map Unary Relationships（映射一元关系）

##### One-to-Many Unary

- Add **recursive foreign key** to same table
- Example: EMPLOYEE (EmployeeID, ..., SupervisorID)
  - SupervisorID is FK referencing EmployeeID in same table

##### Many-to-Many Unary

- Create separate relation with **two foreign keys** to same entity
- Example: PART (PartID, ...) with "Contains" relationship
  - Create PART_STRUCTURE (ParentPartID, ComponentPartID, Quantity)

---

#### Step 6: Map Ternary Relationships（映射三元关系）

- Create new relation
- Include foreign keys from **all three** participating entities
- Primary key = Composite of all three foreign keys (or subset if appropriate)
- Example: VENDOR – Supplies – PART – To – WAREHOUSE
  - Create SUPPLIES (VendorID, PartID, WarehouseID, Quantity)

---

#### Step 7: Map Supertype/Subtype Relationships（映射超类型/子类型关系）

##### Three Approaches:

**a) Single Relation (Table per Hierarchy)**

- One table for supertype
- Include **all attributes** from supertype and all subtypes
- Add **subtype discriminator** column
- **NULL values** for inapplicable attributes
- Best when: Few subtypes, few subtype-specific attributes

**b) Relation per Subtype (Table per Type)**

- One table for **each subtype**
- Each subtype table includes:
  - Primary key (same as supertype)
  - All supertype attributes (repeated)
  - Subtype-specific attributes
- **No supertype table**
- Best when: Subtypes very different, few common attributes

**c) Supertype + Subtype Relations (Table per Subtype)**

- One table for supertype (common attributes)
- One table for each subtype (specific attributes)
- Subtype tables have:
  - Same primary key as supertype (also foreign key)
  - Only subtype-specific attributes
- **Most flexible approach**
- Best when: Many common attributes, distinct subtype attributes

---

### 规范化 Normalization

**Definition**: Process of decomposing relations with anomalies to produce smaller, well-structured relations

#### Purpose:

- Eliminate redundancy
- Prevent update, insertion, and deletion anomalies
- Ensure data integrity

**Normal Form（范式）**: State of a relation requiring certain rules regarding relationships between attributes

---

### 函数依赖 Functional Dependencies

**Definition**: Constraint between two attributes

- **A → B** means: For every valid value of A, there is exactly ONE value of B
- **Determinant（决定因素）**: Attribute on left side (A)
- Read as: "B is functionally dependent on A" or "A determines B"

#### Examples:

- StudentID → StudentName (Student ID determines student name)
- (OrderID, ProductID) → OrderedQuantity (Order and product together determine quantity)

#### Full Functional Dependency

Attribute is dependent on **entire** composite key, not just part of it

#### Partial Functional Dependency（部分函数依赖）

- Nonkey attribute dependent on **part** of composite primary key
- Violates 2NF

#### Transitive Dependency（传递依赖）

- A → B and B → C, then A → C
- Nonkey attribute dependent on primary key **via another nonkey attribute**
- Example: OrderID → CustomerID → CustomerAddress
- Violates 3NF

---

### 范式 Normal Forms

#### First Normal Form (1NF)

- **No multivalued attributes** (no repeating groups)
- **Atomic values** in all cells
- All values in a column from same domain
- Example of violation: Phone = "555-1234, 555-5678" (multiple values)
- Solution: Create separate rows or separate table

---

#### Second Normal Form (2NF)

- Must be in 1NF
- **No partial functional dependencies**
- Every nonkey attribute fully dependent on **entire** primary key
- Applies only to relations with composite keys
- Example violation:
  - ORDER_LINE (OrderID, ProductID, ProductDescription, Quantity)
  - ProductDescription depends only on ProductID (partial dependency)
- Solution: Separate into:
  - ORDER_LINE (OrderID, ProductID, Quantity)
  - PRODUCT (ProductID, ProductDescription)

---

#### Third Normal Form (3NF)

- Must be in 2NF
- **No transitive dependencies**
- Every nonkey attribute dependent **only** on primary key
- Example violation:
  - ORDER (OrderID, OrderDate, CustomerID, CustomerName, CustomerAddress)
  - CustomerName, CustomerAddress transitively dependent via CustomerID
- Solution: Separate into:
  - ORDER (OrderID, OrderDate, CustomerID)
  - CUSTOMER (CustomerID, CustomerName, CustomerAddress)

#### Well-Structured Relation

- Minimal redundancy
- Allows users to insert, modify, delete rows without errors/inconsistencies
- Typically in 3NF or higher

---

### 合并关系 Merging Relations

#### Common Problems:

##### 1. Synonyms（同义词）

- Different names for same attribute
- Example: CustomerID vs. CustID vs. ClientID
- Solution: Standardize on one name

##### 2. Homonyms（同形异义词）

- Same name for different attributes
- Example: "Date" used for OrderDate and ShipDate in different tables
- Solution: Use more specific names

##### 3. Transitive Dependencies（传递依赖）

- May be introduced when merging
- Solution: Further decompose to eliminate

##### 4. Supertype/Subtype Relationships（超类型/子类型关系）

- Recognize during merging
- May need to restructure using approaches from Step 7

---

### 定义关系键的最后步骤 Final Step: Defining Relational Keys

#### Enterprise Keys Recommended:

- **Single-attribute, non-intelligent** identifiers
- Unique across entire database
- Independent of business rules
- More stable than intelligent keys

#### Surrogate Keys When Needed:

- When no natural identifier exists
- When natural identifier is too complex
- System-generated, guaranteed unique

---

## Chapter 5: Physical Database Design and Performance

### 物理数据库设计过程 Physical Database Design Process

**Objective**: Translate logical data model into technical specifications for **storing and retrieving data efficiently**

**Primary Goal**: **Data processing efficiency** (speed > storage space today)

#### Input Requirements:

- Normalized relations with row estimates
- Attribute definitions and physical specs
- Data usage patterns (frequencies of operations)
- Performance requirements (response times)
- DBMS technology characteristics

---

### 关键决策 Key Decisions

1. Choosing **data types** for attributes
2. Handling **missing data**
3. **Denormalizing** relations if necessary
4. **Partitioning** large tables
5. Selecting **file organizations**
6. Creating and managing **indexes**

---

### 选择数据类型 Choosing Data Types

**Data Type（数据类型）**: Detailed coding scheme for representing organizational data

#### Common SQL Data Types:

##### Numeric

- **INTEGER (INT)**: Whole numbers
- **DECIMAL(p,s)**: Fixed-point with precision (p) and scale (s)
- **FLOAT, DOUBLE**: Floating-point

##### Character

- **CHAR(n)**: Fixed-length (padded with spaces)
- **VARCHAR(n)**: Variable-length (saves space)

##### Date/Time

- **DATE, TIME, TIMESTAMP**

##### Boolean & Binary

- **BOOLEAN**, **BLOB**

---

### 处理缺失数据 Handling Missing Data

#### Three Approaches:

1. **Default Value**: Automatically insert predefined value
2. **NOT NULL Constraint**: Force user to enter value
3. **Allow NULL**: Permit absence of value (NULL ≠ zero or blank)

---

### 反规范化 Denormalization

**Definition**: Transforming normalized relations into **non-normalized physical specifications**

**Purpose**: **Improve query performance** by reducing joins

#### When to Consider:

1. Frequently joined tables
2. One-to-one relationships
3. Reference data rarely updated
4. Performance bottlenecks identified

#### Common Types:

1. Combining tables
2. Adding redundant columns
3. Storing derived attributes
4. Repeating groups

#### Cautions:

- Increased storage space
- Update anomalies reappear
- Must maintain consistency
- Use **only after** performance problems identified

---

### 分区 Partitioning

#### Horizontal Partitioning（水平分区）

- Distribute **rows** into separate tables
- Same columns, different rows
- Example: SALES by Region

#### Vertical Partitioning（垂直分区）

- Distribute **columns** into separate tables
- Same primary key, different columns
- Example: EMPLOYEE_BASIC vs EMPLOYEE_PAYROLL

---

### 文件组织类型 File Organization Types

#### 1. Sequential（顺序）

- Records in order by primary key
- Fast for batch processing
- Slow for random access

#### 2. Indexed（索引）

- Uses index for direct access
- Fast for both sequential and random
- Extra storage for indexes

#### 3. Hashed（散列）

- Hashing algorithm converts key to address
- Fastest for direct access
- No sequential access in key order

---

### 索引 Indexes

#### Create Indexes on:

- Primary keys (automatic)
- Foreign keys (speeds joins)
- Columns in WHERE clauses
- Columns in ORDER BY, GROUP BY

#### Avoid Indexes on:

- Small tables
- Low selectivity columns (e.g., Gender)
- Frequently updated columns

---

## Chapter 6: Introduction to SQL

### SQL 语言类型 SQL Language Components

#### 1. Data Definition Language (DDL)

Commands: CREATE, ALTER, DROP

#### 2. Data Manipulation Language (DML)

Commands: SELECT, INSERT, UPDATE, DELETE

#### 3. Data Control Language (DCL)

Commands: GRANT, REVOKE

---

### 创建表 Creating Tables

```sql
CREATE TABLE Customer_T (
    CustomerID     NUMBER(11,0)   NOT NULL,
    CustomerName   VARCHAR2(25)   NOT NULL,
    CustomerAddress VARCHAR2(30),
    CONSTRAINT Customer_PK PRIMARY KEY (CustomerID)
);
```

---

### 列约束 Column Constraints

- **NOT NULL**: Must have value
- **UNIQUE**: All values distinct
- **PRIMARY KEY**: Uniquely identifies (implies NOT NULL + UNIQUE)
- **FOREIGN KEY**: Links to another table
- **CHECK**: Validates data
- **DEFAULT**: Provides default value

---

### 查询数据 SELECT Statement

#### 基本语法:

```sql
SELECT [DISTINCT] column_list
FROM table_list
[WHERE condition]
[GROUP BY column_list]
[HAVING condition]
[ORDER BY column_list [ASC|DESC]];
```

#### Processing Order:

1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. ORDER BY

---

### WHERE 子句运算符

#### Comparison:

`=`, `<>`, `<`, `>`, `<=`, `>=`

#### BETWEEN:

```sql
WHERE Price BETWEEN 100 AND 500
```

#### IN:

```sql
WHERE State IN ('CA', 'TX', 'FL')
```

#### LIKE (Pattern Matching):

- `%` = any sequence
- `_` = single character

```sql
WHERE Name LIKE 'A%'  -- Starts with A
WHERE Name LIKE '_im'  -- Tim, Jim, Kim
```

#### IS NULL:

```sql
WHERE Column IS NULL
WHERE Column IS NOT NULL
```

---

### 聚合函数 Aggregate Functions

```sql
COUNT(*)          -- Number of rows
COUNT(Column)     -- Non-null values
COUNT(DISTINCT)   -- Distinct values
SUM(Column)       -- Total
AVG(Column)       -- Average
MAX(Column)       -- Maximum
MIN(Column)       -- Minimum
```

---

### GROUP BY 和 HAVING

#### GROUP BY:

```sql
SELECT State, COUNT(*) AS Total
FROM Customer_T
GROUP BY State;
```

**Rule**: Columns in SELECT must be in GROUP BY OR inside aggregate function

#### HAVING (filters groups):

```sql
SELECT State, COUNT(*) AS Total
FROM Customer_T
GROUP BY State
HAVING COUNT(*) > 5;
```

---

### 视图 Views

#### Creating Views:

```sql
CREATE VIEW CustomerOrders AS
SELECT C.CustomerID, CustomerName, OrderID
FROM Customer_T C INNER JOIN Order_T O
  ON C.CustomerID = O.CustomerID;
```

#### Benefits:

- Simplify complex queries
- Enhance security
- Provide logical data independence

---

## Chapter 7: Advanced SQL

### 连接表 Joining Tables

#### Inner Join (Equi-Join):

```sql
SELECT CustomerName, OrderID
FROM Customer_T INNER JOIN Order_T
  ON Customer_T.CustomerID = Order_T.CustomerID;
```

#### Multiple Table Join:

```sql
SELECT CustomerName, ProductDescription
FROM Customer_T
  INNER JOIN Order_T ON Customer_T.CustomerID = Order_T.CustomerID
  INNER JOIN OrderLine_T ON Order_T.OrderID = OrderLine_T.OrderID
  INNER JOIN Product_T ON OrderLine_T.ProductID = Product_T.ProductID;
```

**Rule**: For n tables, need (n-1) join conditions

---

### 外连接 Outer Joins

#### LEFT OUTER JOIN:

```sql
SELECT CustomerName, OrderID
FROM Customer_T LEFT OUTER JOIN Order_T
  ON Customer_T.CustomerID = Order_T.CustomerID;
```

**Result**: All customers, even without orders (OrderID = NULL)

#### RIGHT OUTER JOIN:

All orders, even if customer deleted

#### FULL OUTER JOIN:

All rows from both tables

---

### 自连接 Self-Join

```sql
SELECT E.Name AS Employee, S.Name AS Supervisor
FROM Employee_T E INNER JOIN Employee_T S
  ON E.SupervisorID = S.EmployeeID;
```

**Must use aliases** to distinguish copies

---

### 子查询 Subqueries

#### With Comparison:

```sql
SELECT ProductName
FROM Product_T
WHERE Price > (SELECT AVG(Price) FROM Product_T);
```

#### With IN:

```sql
SELECT CustomerName
FROM Customer_T
WHERE CustomerID IN
  (SELECT CustomerID FROM Order_T);
```

#### With NOT IN:

```sql
SELECT CustomerName
FROM Customer_T
WHERE CustomerID NOT IN
  (SELECT CustomerID FROM Order_T);
```

**Result**: Customers who never ordered

#### With EXISTS:

```sql
SELECT CustomerName
FROM Customer_T C
WHERE EXISTS
  (SELECT * FROM Order_T O WHERE O.CustomerID = C.CustomerID);
```

---

### 相关子查询 Correlated Subqueries

Subquery references outer query columns

- Executed once for each outer row
- Typically slower

---

### 组合查询 Combining Queries

#### UNION (removes duplicates):

```sql
SELECT CustomerState FROM Customer_T
UNION
SELECT SupplierState FROM Supplier_T;
```

#### INTERSECT (common rows):

```sql
SELECT CustomerID FROM Customer_T
INTERSECT
SELECT CustomerID FROM Order_T;
```

#### EXCEPT/MINUS (difference):

```sql
SELECT CustomerID FROM Customer_T
EXCEPT
SELECT CustomerID FROM Order_T;
```

---

## Chapter 8: Database Application Development

### 客户机/服务器架构 Client/Server Architectures

#### 1. Application Logic Components（应用逻辑组件）

应用程序通常由三个主要组件组成：

- **Presentation Logic（表示逻辑）**: Input and output (I/O); formatting and presenting data to the user (负责数据的格式化和向用户展示).
- **Processing Logic（处理逻辑）**: Business rules and data management logic (包含业务规则和数据管理逻辑).
- **Storage Logic（存储逻辑）**: Data storage and retrieval (DBMS activities) (负责数据的存储和检索).

#### 2. Client/Server Architectures（客户机/服务器架构）

- **File Server Architecture（文件服务器架构）**: Client does extensive processing; file server just sends files (客户端进行大量处理，文件服务器仅发送文件).
- **Database Server Architecture (Two-Tier)（数据库服务器/两层架构）**:
  - **Client (Front-end)**: Responsible for presentation logic and business rules (负责表示逻辑和业务规则).
  - **Server (Back-end)**: Database storage, access, and processing (DBMS) (负责数据库存储、访问和处理).
  - **Fat Client（胖客户端）**: Client performs most of the processing logic (客户端执行大部分处理逻辑).

#### 3. Three-Tier Architecture（三层架构）

- **Client Layer (Tier 1)**: GUI interface (usually a Web browser); **Thin Client（瘦客户端）** - minimal processing on client (只负责简单的界面展示，处理极少).
- **Application/Web Server (Tier 2)**: Business rules and logic; Web server (处理业务规则和逻辑).
- **Enterprise Database Server (Tier 3)**: Data storage and management (数据存储和管理).
- **Advantages**: Scalability (可扩展性), Technological flexibility (技术灵活性), Lower long-term costs (长期成本更低).

---

### 数据库连接与中间件 Database Connectivity & Middleware

#### 1. Middleware（中间件）

**Definition**: Software that allows an application to interoperate with other software without requiring the user to understand and code the low-level operations (允许应用程序与其他软件互操作的软件).

#### 2. APIs (Application Programming Interfaces)

- **ODBC (Open Database Connectivity)**: Standard API for accessing DBMS; independent of specific DBMS (访问数据库的标准 API，独立于具体的 DBMS).
- **JDBC (Java Database Connectivity)**: API for Java applications to access databases (Java 应用程序访问数据库的 API).

---

### Web 应用开发 Web Application Development

#### 1. Web Application Components（Web 应用组件）

- **Database Server**: Hosts the DBMS (e.g., Oracle, SQL Server).
- **Web Server**: Receives and responds to requests from browser (e.g., Apache, IIS).
- **Application Server**: Software for building dynamic Web sites (e.g., Tomcat, ColdFusion).
- **Web Browser**: Client program (e.g., Chrome, Firefox).

#### 2. Server-Side Languages（服务器端语言）

- **JSP (Java Server Pages)**: Java code embedded in HTML; compiled into servlets (嵌入 HTML 的 Java 代码).
- **ASP.NET**: Microsoft's framework for Web development (微软的 Web 开发框架).
- **PHP**: Open source scripting language (开源脚本语言).

---

### XML 与 Web 服务 XML and Web Services

#### 1. Extensible Markup Language (XML)（可扩展标记语言）

**Definition**: Text-based scripting language used to describe data structures hierarchically (用于分层描述数据结构的文本脚本语言).

- **Data Interchange**: Used for exchanging data between incompatible systems (用于在不兼容系统间交换数据).
- **XSD (XML Schema Definition)**: Language for defining XML databases; replaces DTDs (定义 XML 数据库的语言).
- **XSLT (Extensible Stylesheet Language Transformation)**: Transforms XML documents into other formats (e.g., HTML) (将 XML 转换为其他格式).
- **XPath / XQuery**: Languages for querying XML data (查询 XML 数据的语言).

#### 2. Web Services（Web 服务）

**Definition**: Emerging standards for automatic communication between software over the Web (Web 上软件间自动通信的标准).

- **SOAP (Simple Object Access Protocol)**: XML-based protocol for sending messages (基于 XML 的消息发送协议).
- **WSDL (Web Services Description Language)**: XML-based language to describe Web services (描述 Web 服务的语言).
- **UDDI (Universal Description, Discovery, and Integration)**: Directory service for Web services (Web 服务的目录服务).

#### 3. Service-Oriented Architecture (SOA)（面向服务的架构）

**Concept**: A collection of services that communicate with each other; promotes reusability and interoperability (服务之间相互通信的架构，促进重用和互操作性).

---

## Chapter 9: Data Warehousing

### 核心概念 Core Concepts

#### 1. Data Warehouse（数据仓库）

**Definition**: A **subject-oriented**, **integrated**, **time-variant**, **non-updateable** collection of data used in support of management decision-making processes (面向主题的、集成的、随时间变化的、不可更新的数据集合，用于支持管理决策).

- **Subject-Oriented（面向主题）**: Organized around key subjects (e.g., customers, products) rather than applications (围绕关键主题而非应用组织).
- **Integrated（集成）**: Consistent naming conventions, formats, and encoding structures from multiple data sources (来自多个数据源的数据具有一致的命名和格式).
- **Time-Variant（随时间变化）**: Contains a time dimension to study trends and changes (包含时间维度以研究趋势).
- **Non-Updateable（不可更新）**: Read-only for end users; refreshed periodically (终端用户只读，定期刷新).

#### 2. Data Mart（数据集市）

**Definition**: A data warehouse that is limited in scope; customized for the decision-making of a particular user group (范围有限的数据仓库，为特定用户群定制).

---

### 操作型系统 vs. 信息型系统 Operational vs. Informational Systems

| Feature             | Operational Systems (OLTP)                                        | Informational Systems (OLAP)                                      |
| :------------------ | :---------------------------------------------------------------- | :---------------------------------------------------------------- |
| **Primary Purpose** | Run the business on a current basis (维持日常业务)                | Support managerial decision making (支持管理决策)                 |
| **Type of Data**    | Current, real-time data (当前实时数据)                            | Historical, point-in-time, prediction data (历史、快照、预测数据) |
| **Primary Users**   | Clerks, salespersons, administrators (职员、销售、管理员)         | Managers, business analysts, customers (经理、分析师、客户)       |
| **Scope of Usage**  | Narrow, planned, simple updates/queries (范围窄，简单的更新/查询) | Broad, ad-hoc, complex queries (范围广，复杂的即席查询)           |
| **Design Goal**     | Performance (throughput, availability) (性能：吞吐量、可用性)     | Ease of flexible access and use (灵活访问和易用性)                |

---

### 数据仓库架构 Data Warehouse Architectures

#### 1. Independent Data Marts（独立数据集市）

- Separate ETL for each mart; inconsistent data view (每个集市有独立的 ETL，数据视图不一致).

#### 2. Dependent Data Mart and Operational Data Store (Three-Level)（依赖型数据集市与 ODS）

- **Operational Data Store (ODS)**: Integrated, current-valued, updateable database for operational users (集成的、当前值的、可更新的数据库).
- **Enterprise Data Warehouse (EDW)**: Centralized source for dependent data marts (依赖型数据集市的中心源).

#### 3. Logical Data Mart / Real-Time Data Warehouse（逻辑数据集市/实时数据仓库）

- Data marts are views of the EDW; data is moved into warehouse in near real-time (数据集市是 EDW 的视图；数据近实时移入仓库).

---

### ETL 过程 The ETL Process

**ETL**: Extract, Transform, and Load (抽取、转换、加载).

1.  **Capture/Extract（抽取）**: Obtaining data from source systems (static or incremental extract) (从源系统获取数据).
2.  **Scrub/Cleanse（清洗）**: Using pattern recognition to upgrade data quality (fixing errors, decoding, standardizing) (提升数据质量，修正错误).
3.  **Transform（转换）**: Converting data from source format to warehouse format (record-level: selection, joining, aggregation; field-level: algorithmic, lookups) (转换数据格式).
4.  **Load and Index（加载和索引）**: Placing data into the warehouse (refresh or update mode) (将数据存入仓库).

---

### 维度建模 Dimensional Modeling (Star Schema)

#### 1. Star Schema（星型模式）

**Definition**: A simple database design for ad-hoc queries; separates dimensional data from fact data (用于即席查询的简单数据库设计，分离维度和事实).

- **Fact Table（事实表）**:

  - Central table containing quantitative data (measurements) (包含定量数据/度量的中心表).
  - **Grain（粒度）**: The level of detail in the fact table (e.g., transactional, daily summary) (事实表的细节级别).
  - Typically huge (millions of rows).

- **Dimension Tables（维度表）**:
  - Hold descriptive data (context) about the subjects (e.g., Product, Period, Store) (包含关于主题的描述性数据).
  - Usually denormalized to simplify queries (通常非规范化以简化查询).
  - **Surrogate Keys（代理键）**: Non-intelligent keys used to join fact and dimension tables (用于连接的非智能键).

#### 2. Snowflake Schema（雪花模式）

- An expanded variation of a star schema where dimension tables are normalized into several related tables (星型模式的扩展，维度表被规范化).

---

### 用户接口与分析 User Interface and Analysis

#### 1. OLAP (Online Analytical Processing)（联机分析处理）

- **Slicing and Dicing（切片和切块）**: Analyzing data from different viewpoints (从不同角度分析数据).
- **Drill-down（下钻）**: Going from summary to detail (从汇总数据深入到细节).
- **ROLAP (Relational OLAP)**: Accesses data directly from relational databases (直接访问关系数据库).
- **MOLAP (Multidimensional OLAP)**: Loads data into a multidimensional array (hypercube) (将数据加载到多维数组/超立方体).

#### 2. Data Mining（数据挖掘）

**Definition**: Knowledge discovery using statistical and AI techniques (使用统计和 AI 技术发现知识).

- Goals: Explanatory (解释), Confirmatory (确认), Exploratory (探索).

#### 3. Data Visualization（数据可视化）

- Representation of data in graphical formats (charts, dashboards) for easier analysis (以图形格式展示数据以便分析).

---

## Use Case Diagram & Class Diagram

### Overview of UML (Unified Modeling Language)

**UML (Unified Modeling Language / 统一建模语言)** is a standardized visual modeling language for specifying, visualizing, constructing, and documenting software systems. It was developed by Grady Booch, Ivar Jacobson, and James Rumbaugh, combining the best practices from various object-oriented methods.

**Key Features:**
- Language-independent and process-independent
- Provides multiple perspectives of a system through different diagram types
- Facilitates communication among stakeholders, developers, and domain experts
- Current version: UML 2.2+

---

### 1. Use Case Diagram (用例图)

#### 1.1 Definition and Purpose

**Use Case Diagram** depicts the interaction between users (actors) and the system, showing what functions the system provides and who uses them. It captures the functional requirements from the user's perspective.

**Primary Components:**
- **Actors (参与者)**: Users or external systems that interact with the system
- **Use Cases (用例)**: Actions or services the system provides to accomplish user goals

#### 1.2 Key Symbols and Notation

| Symbol       | Name                           | Description                                  |
| ------------ | ------------------------------ | -------------------------------------------- |
| Stick figure | **Actor (参与者)**             | Represents a user, role, or external system  |
| Oval/Ellipse | **Use Case (用例)**            | Represents a specific function or service    |
| Line         | **Association (关联)**         | Shows interaction between actor and use case |
| Rectangle    | **System Boundary (系统边界)** | Defines the scope of the system              |

#### 1.3 Relationships in Use Case Diagrams

##### 1.3.1 Association (关联关系)
- **Notation**: Solid line connecting actor to use case
- **Meaning**: Shows that an actor participates in a use case
- **Example**: Customer ——— Browse Catalog

##### 1.3.2 Include Relationship (包含关系)
- **Notation**: Dashed arrow with `<<include>>` stereotype
- **Meaning**: One use case always includes the functionality of another
- **Usage**: For extracting common functionality
- **Example**: Place Order ----`<<include>>`----> Validate Payment
- **Direction**: Arrow points from base use case to included use case

##### 1.3.3 Extend Relationship (扩展关系)
- **Notation**: Dashed arrow with `<<extend>>` stereotype
- **Meaning**: One use case optionally extends another under certain conditions
- **Usage**: For optional or exceptional behavior
- **Example**: Basic Search ----`<<extend>>`----> Advanced Filter
- **Direction**: Arrow points from extending use case to base use case

##### 1.3.4 Generalization (泛化关系)
- **Notation**: Solid line with hollow triangle arrowhead
- **Meaning**: Inheritance relationship between actors or use cases
- **Example**: Corporate Customer ———▷ Customer

#### 1.4 Use Case Diagram Example

**Scenario**: Online Shopping System

```
Actors: Customer, Sales Representative, Admin

Use Cases:
- Browse Catalog
- Place Order
- Supply Shipping Information
- Supply Payment Information
- Receive Confirmation
- Manage Products (Admin only)
```

**Relationships**:
- Customer associates with: Browse Catalog, Place Order
- Place Order includes: Supply Shipping Information, Supply Payment Information
- Sales Representative associates with: Receive Confirmation

---

### 2. Class Diagram (类图)

#### 2.1 Definition and Purpose

**Class Diagram** is a static structural diagram that shows the classes in a system, their attributes, methods, and relationships. It provides three perspectives:
- **Conceptual**: Domain concepts and relationships
- **Specification**: Interfaces and contracts
- **Implementation**: Actual code structure

#### 2.2 Class Structure (类结构)

A class is represented as a rectangle divided into three compartments:

```
┌─────────────────────┐
│   ClassName         │  ← Class Name (类名)
├─────────────────────┤
│   - attribute1      │  ← Attributes (属性)
│   ## attribute2      │
│   + attribute3      │
├─────────────────────┤
│   + operation1()    │  ← Operations/Methods (操作/方法)
│   - operation2()    │
└─────────────────────┘
```

#### 2.3 Visibility Modifiers (可见性修饰符)

| Symbol | Visibility             | Meaning                                |
| ------ | ---------------------- | -------------------------------------- |
| `+`    | **Public (公有)**      | Accessible from anywhere               |
| `-`    | **Private (私有)**     | Accessible only within the class       |
| `#`    | **Protected (受保护)** | Accessible within class and subclasses |
| `~`    | **Package (包级)**     | Accessible within the same package     |

#### 2.4 Relationships in Class Diagrams

##### 2.4.1 Association (关联关系)
- **Notation**: Solid line connecting two classes
- **Meaning**: Represents a structural relationship between classes
- **Multiplicity (多重性)**: Indicates how many instances can participate

**Multiplicity Notation**:
| Notation      | Meaning                 |
| ------------- | ----------------------- |
| `1`           | Exactly one             |
| `0..1`        | Zero or one             |
| `*` or `0..*` | Zero or more            |
| `1..*`        | One or more             |
| `n..m`        | Specific range (n to m) |

**Example**:
```
Customer 1 ————————— * Order
    (one customer can have many orders)

Order * ————————— 1 Customer
    (many orders belong to one customer)
```

##### 2.4.2 Aggregation (聚合关系)
- **Notation**: Hollow diamond on the container side
- **Meaning**: "Has-a" relationship; part can exist independently of the whole
- **Lifecycle**: Parts can survive without the whole
- **Example**: Department ◇———— Employee
  - Employees can exist without the department

##### 2.4.3 Composition (组合关系)
- **Notation**: Filled diamond on the container side
- **Meaning**: Strong "contains-a" relationship; part cannot exist without the whole
- **Lifecycle**: If the whole is destroyed, parts are destroyed too
- **Example**: House ◆———— Room
  - Rooms cannot exist without the house

**Key Difference**:
- **Aggregation (聚合)**: Weak ownership, independent lifecycle
- **Composition (组合)**: Strong ownership, dependent lifecycle

##### 2.4.4 Generalization/Inheritance (泛化/继承关系)
- **Notation**: Solid line with hollow triangle arrowhead pointing to parent
- **Meaning**: "Is-a" relationship; child inherits from parent
- **Example**:
```
        Customer
           △
           │
    ┌──────┴──────┐
    │             │
Corporate    Personal
Customer     Customer
```

##### 2.4.5 Realization/Implementation (实现关系)
- **Notation**: Dashed line with hollow triangle arrowhead
- **Meaning**: Class implements an interface
- **Example**: ConcreteClass - - - -▷ Interface

##### 2.4.6 Dependency (依赖关系)
- **Notation**: Dashed arrow
- **Meaning**: One class uses or depends on another (weaker than association)
- **Example**: Client - - - - > Service
  - Changes in Service may affect Client

#### 2.5 Advanced Concepts

##### 2.5.1 Abstract Class (抽象类)
- **Notation**: Class name in *italics* or marked with `{abstract}`
- **Meaning**: Cannot be instantiated; serves as a template for subclasses

##### 2.5.2 Interface (接口)
- **Notation**: Class box with `<<interface>>` stereotype
- **Meaning**: Defines a contract with method signatures only

##### 2.5.3 Constraints (约束)
- **Notation**: Text in curly braces `{constraint}`
- **Common Constraints**:
  - `{ordered}`: Elements have a specific order
  - `{unique}`: No duplicates allowed
  - `{subset}`: One relationship is a subset of another
  - `{disjoint}`: Subclasses are mutually exclusive
  - `{complete}`: All possible subclasses are shown
  - `{incomplete}`: More subclasses may exist

**Example**:
```
Course 1 ———— * {ordered} Offering
    (offerings are ordered by semester)
```

#### 2.6 Complete Class Diagram Example

**Scenario**: Online Shopping System

```
Customer
─────────────────
- customerID: int
- name: String
- email: String
- phone: String
- address: String
─────────────────
+ register(): void
+ login(): boolean
+ updateProfile(): void
+ viewOrderHistory(): List<Order>

        │ 1
        │ has
        │ *
        ▼
      Order
─────────────────
- orderID: int
- orderDate: Date
- status: String
- totalAmount: double
─────────────────
+ placeOrder(): void
+ cancelOrder(): void
+ updateStatus(String): void

        │ 1
        │ has
        │ 1
        ▼
     Payment
─────────────────
- paymentID: int
- paymentType: String
- paymentDate: Date
- amount: double
─────────────────
+ processPayment(): boolean
+ refund(): void
```

**Relationships**:
- Customer 1 ————— * Order (One customer has many orders)
- Order 1 ————— 1 Payment (One order has one payment)
- Order * ————— * Product (Many-to-many through CartItem)
- Customer 1 ————— 1 ShoppingCart (One customer has one cart)
- ShoppingCart 1 ◆————— * CartItem (Composition)

---

### 3. Summary of Key Differences

| Feature           | Use Case Diagram             | Class Diagram                                      |
| ----------------- | ---------------------------- | -------------------------------------------------- |
| **Purpose**       | Functional requirements      | Structural design                                  |
| **Focus**         | User interactions            | System structure                                   |
| **Perspective**   | External view                | Internal view                                      |
| **Elements**      | Actors, Use Cases            | Classes, Attributes, Methods                       |
| **Relationships** | Association, Include, Extend | Association, Aggregation, Composition, Inheritance |
| **When to Use**   | Requirements gathering       | Design and implementation                          |

---

### 4. Best Practices

#### For Use Case Diagrams:
1. **Keep it simple**: Focus on high-level functionality
2. **Name use cases with action verbs**: "Place Order," not "Order Placement"
3. **Identify all actors**: Include both human and system actors
4. **Use include for reusable functionality**: Avoid duplication
5. **Use extend sparingly**: Only for optional behavior

#### For Class Diagrams:
1. **Follow naming conventions**: UpperCamelCase for classes, lowerCamelCase for attributes
2. **Show appropriate detail**: Don't include every getter/setter
3. **Use multiplicity correctly**: Always specify relationship cardinality
4. **Consider three perspectives**: Conceptual → Specification → Implementation
5. **Apply constraints when needed**: Use `{ordered}`, `{unique}`, etc.
6. **Distinguish aggregation vs. composition**: Understand lifecycle dependencies
7. **Keep diagrams readable**: Split complex diagrams into multiple views

---
 
_Course: DAMG 6210 - Data Management and Database Design_
