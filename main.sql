CREATE TABLE Metaclass (
    id INT PRIMARY KEY,
    class_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Classes (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    metaclass_id INT,
    FOREIGN KEY (metaclass_id) REFERENCES Metaclass(id)
);

CREATE TABLE Attributes (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES Classes(id)
);

CREATE TABLE Methods (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES Classes(id)
);

CREATE TABLE ClassRelationships (
    id INT PRIMARY KEY,
    class_id INT,
    related_class_id INT,
    relationship_type VARCHAR(255) NOT NULL,
    FOREIGN KEY (class_id) REFERENCES Classes(id),
    FOREIGN KEY (related_class_id) REFERENCES Classes(id)
);

CREATE TABLE Inheritance (
    id INT PRIMARY KEY,
    class_id INT,
    parent_class_id INT,
    FOREIGN KEY (class_id) REFERENCES Classes(id),
    FOREIGN KEY (parent_class_id) REFERENCES Classes(id)
);

INSERT INTO Metaclass (id, class_name) VALUES (1, 'Person');
INSERT INTO Metaclass (id, class_name) VALUES (2, 'Employee');

INSERT INTO Classes (id, name, metaclass_id) VALUES (1, 'Person', 1);
INSERT INTO Classes (id, name, metaclass_id) VALUES (2, 'Employee', 2);

INSERT INTO Attributes (id, name, class_id) VALUES (1, 'name', 1);
INSERT INTO Attributes (id, name, class_id) VALUES (2, 'age', 1);
INSERT INTO Attributes (id, name, class_id) VALUES (3, 'salary', 2);

INSERT INTO Methods (id, name, class_id) VALUES (1, 'getName', 1);
INSERT INTO Methods (id, name, class_id) VALUES (2, 'getAge', 1);
INSERT INTO Methods (id, name, class_id) VALUES (3, 'getSalary', 2);

INSERT INTO ClassRelationships (id, class_id, related_class_id, relationship_type) VALUES (1, 1, 2, 'INHERITANCE');
INSERT INTO Inheritance (id, class_id, parent_class_id) VALUES (1, 2, 1);

SELECT * FROM Metaclass;
SELECT * FROM Classes;
SELECT * FROM Attributes;
SELECT * FROM Methods;
SELECT * FROM ClassRelationships;
SELECT * FROM Inheritance;