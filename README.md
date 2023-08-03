## 소개
local 환경에서 필요한 서비스를 docker-compose를 통해 쉽게 관리하고 실행합니다.

## 설정
  - .env에 설정을 명시하고 사용합니다.


## 명령어
- make init 
  - 컨테이너를 초기화하고 재시작
- 기타 
  - Makefile을 참고해주세요

## 참고

```
  - compose 실행
  
    make init
  ```
  
  - compose 재생성
  ```
    docker-compose down -v
    docker-compose up --build -d
    
  ```

  - .env 설정 확인
  ```
    docker-compose config
  ```

  - 컨테이너연결
  ```
    docker exec -it {container_name} bash
  ```

  - 전체 이미지와 컨테이너 삭제
  ```
    docker rmi -f $(docker images -q) && docker rm -f $(docker ps -aq)
    docker system prune -f
  ```

- DB Migration
```
  make migrate
```
  
  