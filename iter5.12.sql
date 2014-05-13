-- phpMyAdmin SQL Dump
-- version 3.1.3.1
-- http://www.phpmyadmin.net
--
-- ����: localhost
-- ��������: 2014 �� 05 �� 12 �� 14:58
-- �������汾: 5.1.33
-- PHP �汾: 5.2.9-2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- ���ݿ�: `iter`
--

-- --------------------------------------------------------

--
-- ��Ľṹ `administrator`
--

CREATE TABLE IF NOT EXISTS `administrator` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `AdministratorName` char(20) NOT NULL,
  `Password` char(100) NOT NULL,
  `Email` char(40) NOT NULL,
  `Tel` char(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- �������е����� `administrator`
--

INSERT INTO `administrator` (`id`, `AdministratorName`, `Password`, `Email`, `Tel`) VALUES
(16, 'test', '098f6bcd4621d373cade4e832627b4f6', '7777@jjj', '746358465'),
(19, 'bbking', 'c33367701511b4f6020ec61ded352059', 'bbking@qq.com', '13500135000'),
(20, 'dxinl', '25f9e794323b453885f5181f1b624d0b', '907667336@qq.com', '13580473067'),
(24, 'kelly', '2193779d407fb6480a155eb08c6ba014', 'heyehong189@sina.cn', '13580492529'),
(25, 'dxinl2', '25f9e794323b453885f5181f1b624d0b', '907667336@qq.com', '13580473067'),
(26, 'dxinl15', '25f9e794323b453885f5181f1b624d0b', '907667336@qq.com', '13580473067');

-- --------------------------------------------------------

--
-- ��Ľṹ `career`
--

CREATE TABLE IF NOT EXISTS `career` (
  `CareerID` int(5) NOT NULL AUTO_INCREMENT,
  `CareerName` varchar(20) CHARACTER SET utf8 NOT NULL,
  `CompanyID` int(5) NOT NULL,
  `StartTime` char(16) CHARACTER SET utf8 NOT NULL,
  `EndTime` char(16) CHARACTER SET utf8 NOT NULL,
  `WorkPlace` char(20) CHARACTER SET utf8 NOT NULL,
  `CareerStatus` char(20) CHARACTER SET utf8 DEFAULT NULL,
  `CareerType` enum('1','2','3') CHARACTER SET utf8 DEFAULT NULL,
  `CareerDescription` text CHARACTER SET utf8,
  `CareerRequire` text CHARACTER SET utf8 NOT NULL,
  `Other` text CHARACTER SET utf8,
  PRIMARY KEY (`CareerID`,`CompanyID`),
  KEY `CompanyID` (`CompanyID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- �������е����� `career`
--

INSERT INTO `career` (`CareerID`, `CareerName`, `CompanyID`, `StartTime`, `EndTime`, `WorkPlace`, `CareerStatus`, `CareerType`, `CareerDescription`, `CareerRequire`, `Other`) VALUES
(1, 'CEO����', 0, '2014-05-', '2014-05-', 'GZ', NULL, NULL, '��CEO������', '����˧�ӷ�', '');

-- --------------------------------------------------------

--
-- ��Ľṹ `companyuser`
--

CREATE TABLE IF NOT EXISTS `companyuser` (
  `CompanyID` int(5) NOT NULL AUTO_INCREMENT,
  `CompanyName` char(20) CHARACTER SET utf8 NOT NULL,
  `Password` char(100) CHARACTER SET utf8 NOT NULL,
  `Email` char(40) CHARACTER SET utf8 NOT NULL,
  `Mobile` char(11) CHARACTER SET utf8 NOT NULL,
  `Telphone` char(11) NOT NULL,
  `Address` text NOT NULL,
  `CompanyBasicInfo` text NOT NULL,
  PRIMARY KEY (`CompanyID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- �������е����� `companyuser`
--

INSERT INTO `companyuser` (`CompanyID`, `CompanyName`, `Password`, `Email`, `Mobile`, `Telphone`, `Address`, `CompanyBasicInfo`) VALUES
(1, 'ITer', '81dc9bdb52d04dc20036dbd8313ed055', 'iter@gg.com', '13500135000', '020-8888888', '???????', '');

-- --------------------------------------------------------

--
-- ��Ľṹ `cookies`
--

CREATE TABLE IF NOT EXISTS `cookies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `sso` varchar(80) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `user_agent` varchar(100) NOT NULL,
  `expire` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=80 ;

--
-- �������е����� `cookies`
--

INSERT INTO `cookies` (`id`, `name`, `sso`, `ip`, `user_agent`, `expire`) VALUES
(10, 'kelly', '8acaa8571c3adf6264cb126b76230d2edbea62a6', '172.18.159.250', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 Safa', '1401196845'),
(28, 'hhy', '1425de4d8203ba0cad6391baa9bab8bc4acc9253', '121.33.190.175', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:28.0) Gecko/20100101 Firefox/28.0', '1401967224'),
(32, 'bbking', '159ad8d92dc2db24c4225ebe9f4676514c2335e4', '121.33.190.182', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safa', '1402069043'),
(61, 'sist', '3cd6a6c21dc5864f768edd61da0c6818662574b0', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:26.0) Gecko/20100101 Firefox/26.0', '1402467114'),
(79, 'y', '7a52e754ac3ba7c2ac20c6f2e005b57a46a59df9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.101 Safari/537.', '1402493037');

-- --------------------------------------------------------

--
-- ��Ľṹ `langofresume`
--

CREATE TABLE IF NOT EXISTS `langofresume` (
  `langid` int(5) NOT NULL AUTO_INCREMENT,
  `userid` int(5) NOT NULL,
  `resumeid` int(5) NOT NULL,
  `category` char(40) NOT NULL,
  `rank` char(40) NOT NULL,
  `score` char(40) NOT NULL,
  PRIMARY KEY (`langid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- �������е����� `langofresume`
--

INSERT INTO `langofresume` (`langid`, `userid`, `resumeid`, `category`, `rank`, `score`) VALUES
(1, 10, 36, 'Ӣ��', '����', '666');

-- --------------------------------------------------------

--
-- ��Ľṹ `normaluser`
--

CREATE TABLE IF NOT EXISTS `normaluser` (
  `UserID` int(5) NOT NULL AUTO_INCREMENT,
  `UserName` char(20) NOT NULL,
  `Password` char(100) NOT NULL,
  `Email` char(40) NOT NULL,
  `Tel` char(11) NOT NULL,
  `hasfullbasic` tinyint(1) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `birthofdate` date NOT NULL,
  `politicystate` varchar(20) NOT NULL,
  `address` varchar(60) NOT NULL,
  `eduin` date NOT NULL,
  `eduout` date NOT NULL,
  `school` varchar(30) NOT NULL,
  `major` varchar(100) NOT NULL,
  `eduxueli` varchar(30) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- �������е����� `normaluser`
--

INSERT INTO `normaluser` (`UserID`, `UserName`, `Password`, `Email`, `Tel`, `hasfullbasic`, `gender`, `birthofdate`, `politicystate`, `address`, `eduin`, `eduout`, `school`, `major`, `eduxueli`) VALUES
(3, 'bbking', '81dc9bdb52d04dc20036dbd8313ed055', 'bbking@qq.com', '1234567890', 0, '', '0000-00-00', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '', ''),
(4, 'dxinl', '25f9e794323b453885f5181f1b624d0b', '907667336@qq.com', '13580473067', 0, '', '0000-00-00', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '', ''),
(5, 'dxinl2', '25f9e794323b453885f5181f1b624d0b', '907667336@qq.com', '13580473067', 0, '', '0000-00-00', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '', ''),
(6, 'dxinl3', '25f9e794323b453885f5181f1b624d0b', '907667336@qq.com', '13580473067', 0, '', '0000-00-00', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '', ''),
(7, 'sist', '15067948d688e7cec5ec538b15207273', '183@qq.com', '13560439991', 1, 'Ů', '1993-12-20', 'ƽ��', '���ջ���', '1993-12-20', '1993-12-20', '0000-00-00', '�������ѧ��', '��ר������'),
(8, 'hhy', 'c8ba76c279269b1c6bc8a07e38e78fa4', '1012108173@qq.com', 'www', 0, '', '0000-00-00', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '', ''),
(9, 'yy', '2fb1c5cf58867b5bbc9a1b145a86f3a0', 'cheengyang@qq.com', '12354559992', 1, '��', '1994-12-23', '��Ա', '�㶫��ݸ', '1995-12-20', '1995-12-20', 'ɽ����ѧ', '���������', '���Ƶ�ѧ�����԰�'),
(10, 'y', '415290769594460e2e485922904f345d', '2312@qq.com', '123564', 1, 'Ů', '1992-12-12', '��Ա', '�㶫����', '2005-12-23', '2015-12-23', '������ѧ', '�������ѧ�뼼��', '����');

-- --------------------------------------------------------

--
-- ��Ľṹ `resumedetail`
--

CREATE TABLE IF NOT EXISTS `resumedetail` (
  `ResumeID` int(5) NOT NULL AUTO_INCREMENT,
  `UserID` int(5) NOT NULL,
  `Identity` char(18) NOT NULL,
  `Education` enum('��ʿ','˶ʿ','����','��ר','����') NOT NULL,
  `EmergencyContacter` char(20) NOT NULL,
  `EmergencyTel` char(11) NOT NULL,
  `Gender` enum('��','Ů','����') NOT NULL,
  `Birth_of_Date` char(8) NOT NULL,
  `School` char(20) NOT NULL,
  `Major` char(40) NOT NULL,
  `Email` char(40) NOT NULL,
  `Tel` char(11) NOT NULL,
  `Address` text NOT NULL,
  `WorkType` enum('��ְ','ȫְ') NOT NULL,
  `Blog` text NOT NULL,
  `Salary` text NOT NULL,
  `PoliticyState` text NOT NULL,
  `SelfEvaluation` text NOT NULL,
  `Awards` text NOT NULL,
  `MainCourses` text NOT NULL,
  `SocialPractice` text NOT NULL,
  `Language` text NOT NULL,
  `eduin` date NOT NULL,
  `eduout` date NOT NULL,
  `eduxueli` varchar(50) NOT NULL,
  `UserName` varchar(30) NOT NULL,
  PRIMARY KEY (`ResumeID`,`UserID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- �������е����� `resumedetail`
--

INSERT INTO `resumedetail` (`ResumeID`, `UserID`, `Identity`, `Education`, `EmergencyContacter`, `EmergencyTel`, `Gender`, `Birth_of_Date`, `School`, `Major`, `Email`, `Tel`, `Address`, `WorkType`, `Blog`, `Salary`, `PoliticyState`, `SelfEvaluation`, `Awards`, `MainCourses`, `SocialPractice`, `Language`, `eduin`, `eduout`, `eduxueli`, `UserName`) VALUES
(3, 1, '12345647987891', '˶ʿ', 's', 's', '', '1993-01-', 's', 's', '18315484828@qq.com', 's', 's ', '', 's ', '', '1', '', '', '', '', '', '0000-00-00', '0000-00-00', '', ''),
(4, 1, 's', '˶ʿ', 's', 's', '��', '1993-01-', 's', 's', 's', 's', 's', '', 's', '', '1', '', '', '', '', '', '0000-00-00', '0000-00-00', '', ''),
(5, 2, '3406219913311112', '', '�»���', '135656434', '��', '1993-01-', '��ɽ��ѧ', '�����', '132324@qq.com', '13560439991', '��ɽ��ѧ��˼԰', '', 'cheng35', '', '1', '', '', '', '', '', '0000-00-00', '0000-00-00', '', ''),
(6, 2, '3406219913311112', '', '�»���', '135656434', '��', '1993-01-', '��ɽ��ѧ', '�����', '132324@qq.com', '13560439991', '��ɽ��ѧ��˼԰', '', 'cheng35', '', '1', '', '', '', '', '', '0000-00-00', '0000-00-00', '', ''),
(7, 1, 'fdfads', '˶ʿ', 'dfasfa', 'fadsfd', '��', '1993-01-', 'dfas', 'fdas', 'dsfa@qq.com', 'dfa', 'fadsfdsa', '', 'fdasf', '', '1', '', '', '', '', '', '0000-00-00', '0000-00-00', '', ''),
(8, 1, 'fdfads', '˶ʿ', 'dfasfa', 'fadsfd', '��', '1993-01-', 'dfas', 'fdas', 'dsfa@qq.com', 'dfa', 'fadsfdsa', '', 'fdasf', '', '1', '', '', '', '', '', '0000-00-00', '0000-00-00', '', ''),
(9, 1, 'fdfads', '˶ʿ', 'dfasfa', 'fadsfd', '��', '1993-01-', 'dfas', 'fdas', 'dsfa@qq.com', 'dfa', 'fadsfdsa', '', 'fdasf', '', '1', '', '', '', '', '', '0000-00-00', '0000-00-00', '', ''),
(10, 1, 'fdfads', '˶ʿ', 'dfasfa', 'fadsfd', '��', '1993-01-', 'dfas', 'fdas', 'dsfa@qq.com', 'dfa', 'fadsfdsa', '', 'fdasf', '', '1', '', '', '', '', '', '0000-00-00', '0000-00-00', '', ''),
(11, 1, 'fdfads', '˶ʿ', 'dfasfa', 'fadsfd', '��', '1993-01-', 'dfas', 'fdas', 'dsfa@qq.com', 'dfa', 'fadsfdsa', '', 'fdasf', '', '1', '', '', '', '', '', '0000-00-00', '0000-00-00', '', ''),
(12, 1, 'fdfads', '˶ʿ', 'dfasfa', 'fadsfd', '��', '1993-01-', 'dfas', 'fdas', 'dsfa@qq.com', 'dfa', 'fadsfdsa', '', 'fdasf', '', '1', '', '', '', '', '', '0000-00-00', '0000-00-00', '', ''),
(13, 1, 'fdfads', '˶ʿ', 'dfasfa', 'fadsfd', '��', '1993-01-', 'dfas', 'fdas', 'dsfa@qq.com', 'dfa', 'fadsfdsa', '', 'fdasf', '', '1', '', '', '', '', '', '0000-00-00', '0000-00-00', '', ''),
(14, 1, 'fdfads', '˶ʿ', 'dfasfa', 'fadsfd', '��', '1993-01-', 'dfas', 'fdas', 'dsfa@qq.com', 'dfa', 'fadsfdsa', '', 'fdasf', '', '1', '', '', '', '', '', '0000-00-00', '0000-00-00', '', ''),
(15, 1, 'fdfads', '˶ʿ', 'dfasfa', 'fadsfd', '��', '1993-01-', 'dfas', 'fdas', 'dsfa@qq.com', 'dfa', 'fadsfdsa', '', 'fdasf', '', '1', '', '', '', '', '', '0000-00-00', '0000-00-00', '', ''),
(16, 7, '340521', '˶ʿ', 'dfa', 'dasfds', '��', '1993-01-', '��ɽ��ѧ', '�����', '121@qq.com', '13560439991', '��ɽ��ѧ', '', 'fdsfa', '', '1', '', '', '', '', '', '0000-00-00', '0000-00-00', '', ''),
(17, 3, '585858585858585858', '˶ʿ', 'cbj', '13500350000', '��', '1993-01-', 'sysu', 'cs', 'bbking@qq.com', '13500135000', 'guangzhou', '', 'bbking.com', '', '1', '', '', '', '', '', '0000-00-00', '0000-00-00', '', ''),
(18, 10, '', '��ʿ', '', '', 'Ů', '1992-12-', '������ѧ', '�������ѧ�뼼��', '2312@qq.com', '123564', '�㶫����', '��ְ', '', '', '��Ա', '', '', '', '', '', '2005-12-23', '2015-12-23', '����', ''),
(19, 10, '', '��ʿ', '', '', 'Ů', '1992-12-', '������ѧ', '�������ѧ�뼼��', '2312@qq.com', '123564', '�㶫����', '��ְ', '', '', '��Ա', '', '', '', '', '', '2005-12-23', '2015-12-23', '����', ''),
(20, 10, '', '��ʿ', '', '', 'Ů', '1992-12-', '������ѧ', '�������ѧ�뼼��', '2312@qq.com', '123564', '�㶫����', '��ְ', '', '', '��Ա', '', '', '', '', '', '2005-12-23', '2015-12-23', '����', ''),
(21, 10, '', '��ʿ', '', '', 'Ů', '1992-12-', '������ѧ', '�������ѧ�뼼��', '2312@qq.com', '123564', '�㶫����', '��ְ', '', '', '��Ա', '', '', '', '', '', '2005-12-23', '2015-12-23', '����', ''),
(22, 10, '', '��ʿ', '', '', 'Ů', '1992-12-', '������ѧ', '�������ѧ�뼼��', '2312@qq.com', '123564', '�㶫����', '��ְ', '', '', '��Ա', '', '', '', '', '', '2005-12-23', '2015-12-23', '����', ''),
(23, 10, '', '��ʿ', '', '', 'Ů', '1992-12-', '������ѧ', '�������ѧ�뼼��', '2312@qq.com', '123564', '�㶫����', '��ְ', '', '', '��Ա', '', '', '', '', '', '2005-12-23', '2015-12-23', '����', ''),
(24, 10, '', '��ʿ', '', '', 'Ů', '1992-12-', '������ѧ', '�������ѧ�뼼��', '2312@qq.com', '123564', '�㶫����', '��ְ', '', '', '��Ա', '', '', '', '', '', '2005-12-23', '2015-12-23', '����', ''),
(25, 10, '', '��ʿ', '', '', 'Ů', '1992-12-', '������ѧ', '�������ѧ�뼼��', '2312@qq.com', '123564', '�㶫����', '��ְ', '', '', '��Ա', '', '', '', '', '', '2005-12-23', '2015-12-23', '����', ''),
(26, 10, '', '��ʿ', '', '', 'Ů', '1992-12-', '������ѧ', '�������ѧ�뼼��', '2312@qq.com', '123564', '�㶫����', '��ְ', '', '', '��Ա', '', '', '', '', '', '2005-12-23', '2015-12-23', '����', ''),
(27, 10, '', '��ʿ', '', '', 'Ů', '1992-12-', '������ѧ', '�������ѧ�뼼��', '2312@qq.com', '123564', '�㶫����', '��ְ', '', '', '��Ա', '', '', '', '', '', '2005-12-23', '2015-12-23', '����', ''),
(28, 10, '', '��ʿ', '', '', 'Ů', '1992-12-', '������ѧ', '�������ѧ�뼼��', '2312@qq.com', '123564', '�㶫����', '��ְ', '', '', '��Ա', '', '', '', '', '', '2005-12-23', '2015-12-23', '����', ''),
(29, 10, '', '��ʿ', '', '', 'Ů', '1992-12-', '������ѧ', '�������ѧ�뼼��', '2312@qq.com', '123564', '�㶫����', '��ְ', '', '', '��Ա', '', '', '', '', '', '2005-12-23', '2015-12-23', '����', ''),
(30, 10, '', '��ʿ', '', '', 'Ů', '1992-12-', '������ѧ', '�������ѧ�뼼��', '2312@qq.com', '123564', '�㶫����', '��ְ', '', '', '��Ա', '', '', '', '', '', '2005-12-23', '2015-12-23', '����', ''),
(31, 10, '', '��ʿ', '', '', 'Ů', '1992-12-', '������ѧ', '�������ѧ�뼼��', '2312@qq.com', '123564', '�㶫����', '��ְ', '', '', '��Ա', '', '', '', '', '', '2005-12-23', '2015-12-23', '����', ''),
(32, 10, '', '��ʿ', '', '', 'Ů', '1992-12-', '������ѧ', '�������ѧ�뼼��', '2312@qq.com', '123564', '�㶫����', '��ְ', '', '', '��Ա', '', '', '', '', '', '2005-12-23', '2015-12-23', '����', ''),
(33, 10, '', '��ʿ', '', '', 'Ů', '1992-12-', '������ѧ', '�������ѧ�뼼��', '2312@qq.com', '123564', '�㶫����', '��ְ', '', '', '��Ա', '', '', '', '', '', '2005-12-23', '2015-12-23', '����', ''),
(34, 10, '', '��ʿ', '', '', 'Ů', '1992-12-', '������ѧ', '�������ѧ�뼼��', '2312@qq.com', '123564', '�㶫����', '��ְ', '', '', '��Ա', '', '', '', '', '', '2005-12-23', '2015-12-23', '����', ''),
(35, 10, '', '��ʿ', '', '', 'Ů', '1992-12-', '������ѧ', '�������ѧ�뼼��', '2312@qq.com', '123564', '�㶫����', '��ְ', '', '', '��Ա', '', '', '', '', '', '2005-12-23', '2015-12-23', '����', ''),
(36, 10, '', '��ʿ', '', '', 'Ů', '1992-12-', '������ѧ', '�������ѧ�뼼��', '2312@qq.com', '123564', '�㶫����', '��ְ', '', '', '��Ա', '', '', '', '', '', '2005-12-23', '2015-12-23', '����', '');

-- --------------------------------------------------------

--
-- ��Ľṹ `resumestatus`
--

CREATE TABLE IF NOT EXISTS `resumestatus` (
  `UserID` int(5) NOT NULL,
  `ResumeID` int(5) NOT NULL,
  `CompanyID` int(5) NOT NULL,
  `Status` enum('��Ͷ��','HR����','HR����Ȥ','ְλ�ѹ���') DEFAULT NULL,
  PRIMARY KEY (`UserID`,`ResumeID`,`CompanyID`),
  KEY `ResumeID` (`ResumeID`),
  KEY `CompanyID` (`CompanyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- �������е����� `resumestatus`
--


-- --------------------------------------------------------

--
-- ��Ľṹ `userresume`
--

CREATE TABLE IF NOT EXISTS `userresume` (
  `UserID` int(5) NOT NULL,
  `ResumeID` int(5) NOT NULL,
  PRIMARY KEY (`UserID`,`ResumeID`),
  KEY `ResumeID` (`ResumeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- �������е����� `userresume`
--

