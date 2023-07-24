create table departments (
dept_no varchar(20) not null primary key,
dept_name varchar(300)
);

create table titles(
title_id varchar(300) not null primary key,
title varchar(300)
);

create table employees(
emp_no int not null primary key,
emp_title_id varchar(300),
birth_date date,
first_name varchar(300),
last_name varchar(300),
sex varchar(20),
hire_date date,
foreign key (emp_title_id) references titles(title_id)
);

create table salaries(
emp_no int,
salary int,
foreign key (emp_no) references employees(emp_no)
);

create table dept_emp(
emp_no int,
dept_no varchar(20),
foreign key (emp_no) references employees(emp_no),
foreign key (dept_no) references departments(dept_no)
);

create table dept_manager(
dept_no varchar(20),
emp_no int,
foreign key (emp_no) references employees(emp_no),
foreign key (dept_no) references departments(dept_no)
);

-- now import the data in the order the tables were created