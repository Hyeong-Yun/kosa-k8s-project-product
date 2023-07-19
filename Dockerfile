# 베이스 이미지 선택
FROM nginx:latest

# 컨테이너 내부의 작업 디렉토리 설정
WORKDIR /etc/nginx/conf.d

# 기존 default.conf 파일을 백업
RUN mv default.conf default.conf.bak

# 호스트의 변경된 default.conf 파일을 컨테이너로 복사
COPY default.conf /etc/nginx/conf.d/default.conf

RUN mkdir /usr/share/nginx/html/product

COPY index.html /usr/share/nginx/html/product

# 컨테이너가 80번 포트를 사용하도록 설정 (NGINX의 기본 포트)
EXPOSE 80

# 컨테이너 시작 시 실행할 명령어
CMD ["nginx", "-g", "daemon off;"]