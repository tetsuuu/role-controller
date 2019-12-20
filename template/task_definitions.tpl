[
  {
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "/ecs/${name}",
        "awslogs-region": "ap-northeast-1",
        "awslogs-stream-prefix": "ecs"
      }
    },
    "command": ["./list_rules.sh", "${flag}"] ,
    "cpu": 0,
    "image": "${image_url}",
    "essential": true,
    "name": "${name}"
  }
]
