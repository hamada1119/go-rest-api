# 技術スタック
- フロントエンド: Next.js, TypeScript, React(MUI)
- バックエンド: Go(golang)
- データベース: PostgreSQL (Docker コンテナ)
- Web サーバー/リバースプロキシ: Nginx
- SSL/TLS 証明書: Let’s Encrypt (certbot)
- インフラ: AWS EC2, Vercel
- コンテナ管理: Docker / docker-compose
- CI/CD: GitHub Actions

# 目的
- 本リポジトリはToDoアプリの開発を通じて、Go 言語と Docker を中心にインフラ構築・運用のキャッチアップを目的として作成
- 特に以下のスキルを中心に学習
	1.	Docker を用いたマルチコンテナ構成（Go / PostgreSQL / Nginx の連携）
	2.	SSL 化による HTTPS 通信の構築（Let’s Encrypt を利用）
	3.	AWS EC2 上でのデプロイと永続化（DBデータ・証明書の永続化）
	4.	CI/CD パイプラインの構築（GitHub Actions を用いた自動デプロイ）
    5.	クリーンアーキテクチャの学習
