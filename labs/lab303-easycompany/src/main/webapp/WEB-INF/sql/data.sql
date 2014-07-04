DROP TABLE IF EXISTS `test`.`employee`;
CREATE TABLE  `test`.`employee` (
  `employeeid` int(11) NOT NULL,
  `firstname` varchar(100) default NULL,
  `lastname` varchar(100) default NULL,
  `age` int(11) default NULL,
  `departmentid` varchar(100) default NULL,
  `password` varchar(100) default NULL,
  `email` varchar(200) default NULL,
  PRIMARY KEY  (`employeeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `test`.`department`;
CREATE TABLE  `test`.`department` (
  `departmentid` varchar(10) NOT NULL,
  `departmentname` varchar(100) NOT NULL,
  `super_departmentid` varchar(10) default NULL,
  `reg_no` decimal(10,0) default NULL,
  `red_dt` varchar(13) default NULL,
  PRIMARY KEY  (`departmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;