## 설정
  - .env에 지정하여 docker-compose에서 서비스들을 구성하는데 사용합니다.

## 명령어
  - compose 실행
  ```
    docker-compose up -d
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
  
  