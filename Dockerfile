# ベースとなるGo公式イメージを指定（Go 1.23.3）
FROM golang:1.23.3

# コンテナ内の作業ディレクトリを /app にする
WORKDIR /app

# 先に go.mod と go.sum だけコピー（キャッシュ効かせる）
# [TODO]go.sum を生成して追加する
COPY go.mod .
COPY main.go .

# カレントディレクトリの全ファイルをコンテナ内の /app にコピー
# COPY . .

# 原因調査用コマンド
RUN ls -la /app
RUN cat /app/main.go

# Goプログラムをビルドして "app" という実行ファイルを作る
RUN go build -o app

# コンテナ起動時に実行されるコマンド（サーバー起動）
CMD ["./app"]
