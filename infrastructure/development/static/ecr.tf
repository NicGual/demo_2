resource "aws_ecr_repository" "dev-image-storage" {
  name = "dev-branch-images"
  image_tag_mutability = "IMMUTABLE"
}

resource "aws_ecr_lifecycle_policy" "app-images-policy" {
  repository = aws_ecr_repository.dev-image-storage.name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Keep last 5 images",
            "selection": {
                "tagStatus": "any",
                "countType": "imageCountMoreThan",
                "countNumber": 5
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}