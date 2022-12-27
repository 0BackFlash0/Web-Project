-- MySQL dump 10.13  Distrib 8.0.31, for macos11.7 (x86_64)
--
-- Host: localhost    Database: ProjectTest
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `objective`
--

DROP TABLE IF EXISTS `objective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objective` (
  `id` int NOT NULL,
  `choices` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objective`
--

LOCK TABLES `objective` WRITE;
/*!40000 ALTER TABLE `objective` DISABLE KEYS */;
INSERT INTO `objective` VALUES (1,'1. `_3stat` \n2. `_aB` \n3. `A123` \n4. `1xy``','4'),(2,'1. TCP/IP 네트워크의 IP 계층은 OSI 참조 모델(OSI reference model)의 네트워크 계층에 해당한다. \n2. UDP 프로토콜을 사용할 경우 패킷이 유실될 수 있으므로 응용 프로그램 계층에서 이를 고려하여 구현해야 한 다. \n3. TCP 프로토콜을 사용하면 사용자의 데이터가 최초로 서버에 전송되기 전에 최소 3개의 패킷을 클라이언트와 서 버가 주고받아야 한다. \n4. TCP 프로토콜을 사용하면 순서가 역전되어 받은 패킷을 응용 프로그램 계층에서 재정렬해야 한다. ','4'),(4,'1. `사과와 바나나 값은 ${apple+banana}원 입니다`\n2. \'\'사과와 바나나 값은 ${apple+banana}원 입니다\'\'\n3. \'\'사과와 바나나 값은 ${apple+banana}원 입니다\'\'\n4. \'\'사과와 바나나 값은 %d원 입니다\'\'%(apple+banana)','1'),(5,'1. 40\n2. 9\n3. 19\n4. 5','3'),(6,'1. [i for i in range(5) if i%2==0 elif i==1 \'\'odd-1\'\' else \'\'odd-3\'\']\n2. [i if i%2==0 else \'\'odd-1\'\' if i==1 else \'\'odd-3\'\'  for i in range(5)]\n3. [i if i%2==0 elif i==1 \'\'odd-1\'\' else \'\'odd-3\'\'  for i in range(5)]\n4. [i if i%2==0 if i==1 else \'\'odd-1\'\' else \'\'odd-3\'\'  for i in range(5)]','2'),(7,'1. Error\n2. 0 가 3 라 13 하 9 차\n3. 0 가 3 라 9 차 13 하\n4. 정답없음','3'),(8,'1. SELECT * FROM (table이름) ORDER BY RoomNum, ReserveDate REVERSE; \n2. SELECT * FROM (table이름) ORDER BY ReserveDate DESC, RoomNum ASC;\n3. SELECT * FROM (table이름) ORDER BY ReserveDate ASC, RoomNum DESC;\n4. SELECT * FROM (table이름) ORDER BY ReserveDate DESC, RoomNum;','2'),(10,'1. 인터프리터는 초기 스캔시간이 오래 걸리지만, 한번 실행 파일을 만들고 나면 빠르다. 2. 컴파일러 언어에는 대표적으로 Python, Ruby, Javascript 등이 있다. 3. 인터프리터는 프로그램 실행시 한 번에 한 문장씩 번역한다. 4. 컴파일러는 프로그램을 실행시키고 나서 오류를 발견하면 바로 실행을 중지 시킨다. 실행 후에 오류를 알 수 있다.','3'),(12,'1.(가): join (나): split 2.(가): strip(나): join 3.(가): split(나): join 4.(가): zip(나): round','3');
/*!40000 ALTER TABLE `objective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem`
--

DROP TABLE IF EXISTS `problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `category` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `imgurl` text,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `explanation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `writer` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem`
--

LOCK TABLES `problem` WRITE;
/*!40000 ALTER TABLE `problem` DISABLE KEYS */;
INSERT INTO `problem` VALUES (1,'객관식','파이썬','','다음중 파이썬 변수로 사용할 수 없는 것을 골라라.','변수는 숫자로 시작할 수 없다','김민진'),(2,'객관식','cs','','다음 중 설명이 잘못된 것을 고르시오.','- TCP 프로토콜을 쓰게 되면, 순서가 역전되어 받은 패킷을 응용 프로그램 계층에서 재정렬해야 합니다','고상현'),(3,'주관식','복습','','웹 수업 Day 8 자판기 실습에서 권영길 강사님이 예제로 보여준 자판기의 디저트 \'\'타르트\'\'의 가격을 숫자로만 작성하세요. (답이 2,000원 일 경우, 2000 입력)','','이혁수'),(4,'객관식','자바스크립트','','템플릿 리터럴을 활용해 사과와 바나나 의 가격의 합을 표현하고자 할 때 적절한 것을 고르시오.\n(조건) let apple = 100;\nlet banana = 200;','템플릿 리터럴은 `(백틱)으로 감싸 사용할 수 있다.','이혁수'),(5,'객관식','알고리즘','https://dbscthumb-phinf.pstatic.net/3523_000_1/20141020113635377_9H3WMM4G9.jpg/ka7_134_i1.jpg?type=w383_fst&wm=N','퀵 정렬 (Quick Sort)를 통해 다음 배열을 정렬하고자 한다.\n20 18 50 40 9 19 5 25\n기준 키를 가장 앞의 항목 (20)으로 설정했다고 했을 때, 첫 순회 이후 기준키와 바꾸는 항목은?','퀵 정렬 알고리즘은 기준키보다 작은 값을 기준키보다 앞으로, 큰 값은 뒤로 보내며 정렬하는 알고리즘이다.\n가장 처음에 50과 5의 위치가 변하고, 그 다음에는 40과 19의 위치가 변한다. 이후에 기준값보다 작은 9를 기준키인 20과 교환한다.','김병진'),(6,'객관식','파이썬','','result = []\nfor i in range(5):\n    if i%2 ==0:\n        result.append(i)\n    elif i==1:\n        result.append(\'\'odd-1\'\')\n    else:\n        result.append(\'\'odd-3\'\')          출력: result  -> [0, \'\'odd-1\'\', 2, \'\'odd-3\'\', 4].   에 올바른 리스트 컴프리헨션은?','왼쪽에 if else 문은 여러 개를 사용할 수 있습니다. \n그렇게 되면 elif와 같은 효과를 주게 됩니다.','고건영'),(7,'객관식','파이썬','','name\n0     가\n1     나\n2     다\n3     라\n4     마\n5     바\n6     사\n7     아\n8     자\n9     차\n10    카\n11    타\n12    파\n13    하\n인 데이터 프레임에서 df[df[\'\'name\'\'].str.contains(\'\'가|라|하|차\'\')] 이 코드가 오류가 날까요?? \n코드의 결과값으로 적당한 것은?','str.contains(\'\' \'\') 안에 | 는 OR로 작동이 된다. 또한 DataFrame의 index 순서대로 출력된다','고건영'),(8,'객관식','MYSQL','','MYSQL에서 SELECT 로 출력되는 값을 다음과 같은 정렬상태로 나타내고자 한다. 그 입력값으로 적당한 것은?\n[다음] ReserveDate 는 내림차순, RoomNum 는 오름차순','ORDER BY 는 각 COLUMN에 따라 오른차순이면 ASC, 내림차순이면 DESC 맞춰 입력하면 된다.','이혁수'),(9,'주관식','파이썬','','다음 코드를 실행했을 때 myData에 저장된 값은 몇 개인가 ?\n\nmyData = {1, 1, 1, 2, 2, 3, 3, 3}\nmyData.add(1)','Set 형이기 때문에 key의 중복을 허용하지 않는다. 따라서 {1, 2, 3}이 저장되므로 값은 3개다.','김민진'),(10,'객관식','cs','','컴파일러와 인터프리터에 대한 설명으로 옳은 것은?\n','컴파일러(compiler)\n\n전체 파일을 스캔하여 한꺼번에 번역한다.\n초기 스캔시간이 오래 걸리지만, 한번 실행 파일이 만들어지고 나면 빠르다.\n기계어 번역과정에서 더 많은 메모리를 사용한다.\n전체 코드를 스캔하는 과정에서 모든 오류를 한꺼번에 출력해주기 때문에 실행 전에 오류를 알 수 있다.\n대표적인 언어로 C, C++, JAVA 등이 있다.\n\n\n인터프리터(interpreter)\n\n프로그램 실행시 한 번에 한 문장씩 번역한다.\n한번에 한문장씩 번역후 실행 시키기 때문에 실행 시간이 느리다.\n컴파일러와 같은 오브젝트 코드 생성과정이 없기 때문에 메모리 효율이 좋다.\n프로그램을 실행시키고 나서 오류를 발견하면 바로 실행을 중지 시킨다. 실행 후에 오류를 알 수 있다.\n대표적인 언어로 Python, Ruby, Javascript 등이 있다.','고상현'),(11,'주관식','파이썬','','test = [\'\'1\'\',\'\'12\'\',\'\'123\'\',\'\'1234\'\',\'\'12345\'\',\'\'123456\'\',\'\'1234567\'\'] 인 리스트에서 각 요소 중에서 가장 큰 len 값 하나만  알고 싶을 때 옳은 것은?','1번. 리스트 요소가 숫자가 아니므로 오류.\n2번. 모든 len값이 나오므로 X.\n3. 인덱스가 0~6까지이므로 X.\n4. max() 안에 컴프리헨션이 들어갈 수 있다.\n max( [len(i) for i in test] ) 도 같은 결과이다.','고건영'),(12,'객관식','파이썬','','a=(#a:#b:#c:#d)를 a#:b#:c#:d# 으로 변경하려고 한다. (가)와 (나)의 들어갈 내용으로 맞는 것은?\n\nb=a. (가)_____(“:”)\n\nc=“#”.(나)_____(b)\n\nprint(c) —> a#:b#:c#:d#\n\n ','round(number[, ndigits]) 함수는 숫자를 입력받아 반올림해 리턴하는 함수이다.\n\nzip(*iterable)은 동일한 개수로 이루어진 데이터들을 묶어서 리턴하는 함수이다.\n여기서 사용한 *iterable은 반복 가능(iterable)한 데이터 여러 개를 입력할 수 있다는 의미이다.\n\nsplit()은 sep 를 구분자 문자열로 사용하여 문자열에 있는 단어들의 리스트를 돌려준다. maxsplit 가 주어지면 최대 maxsplit 번의 분할이 수행된다.(따라서 리스트는 최대 maxsplit + 1 개의 요소를 가지게 된다)\n\n\nstrip()은 선행과 후행 문자가 제거된 문자열의 복사본을 돌려준다. chars 인자는 제거할 문자 집합을 지정하는 문자열이다. 생략되거나 None 이라면, chars 인자의 기본값은 공백을 제거하도록 한다.. chars 인자는 접두사가 아니다. 모든 값 조합이 제거 된다.\n','고상현'),(13,'주관식','알고리즘','https://www.techiedelight.com/wp-content/uploads/2016/11/Depth-first-tree.png','<div> 다음은 그래프를 DFS (깊이 우선 탐색)한 결과이다.\n만약 다음과 같은 그래프를 BFS (너비 우선 탐색)을 한다고 했을 때, 올바른 탐색 순서를 적어라.\n(입력 예시 : 1 2 3 4 ...)\n(단, 동일한 레벨의 경우, 왼쪽부터 오른쪽 순으로 탐색한다.)','너비 우선 탐색의 경우, 한 계층 (Level)을 왼쪽부터 오른쪽으로 순회한다.\nroot인 1을 시작으로 그 다음 계층인 2, 7, 8을 모두 탐색하고 그 다음은 3, 6, 9, 12, 마지막 계층인 4, 5, 10, 11 순으로 탐색한다.','김병진');
/*!40000 ALTER TABLE `problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solving`
--

DROP TABLE IF EXISTS `solving`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solving` (
  `user_id` varchar(40) DEFAULT NULL,
  `problem_id` int DEFAULT NULL,
  `solved` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solving`
--

LOCK TABLES `solving` WRITE;
/*!40000 ALTER TABLE `solving` DISABLE KEYS */;
INSERT INTO `solving` VALUES ('kbj',1,1),('kbj',2,0),('kkm',2,1),('kbj',3,1),('새싹이2',10,1),('새싹이2',9,0),('새싹이2',1,1),('새싹이2',2,1);
/*!40000 ALTER TABLE `solving` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjective`
--

DROP TABLE IF EXISTS `subjective`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjective` (
  `id` int NOT NULL,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjective`
--

LOCK TABLES `subjective` WRITE;
/*!40000 ALTER TABLE `subjective` DISABLE KEYS */;
INSERT INTO `subjective` VALUES (3,'3500'),(9,'3개'),(11,'3'),(13,'1 2 7 8 3 6 9 12 4 5 10 11');
/*!40000 ALTER TABLE `subjective` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pwd` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Lv` int NOT NULL DEFAULT '1',
  `Exp` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('123','1234','asd',1,0),('12345','12345','asdasdf',1,0),('aaaa','1111','asdf',1,0),('kbj','1111','김병진',1,0),('새싹이2','pbkdf2:sha256:260000$gtX6bwgClDaotwjo$c8941e066dbe57c669ed9c6c0fb4edac5327498586221d74258962c174023957','고건영',1,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ProjectTest'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-22 15:02:03
