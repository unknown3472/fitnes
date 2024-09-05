-- name: GetUser :one
select * from users
where id = $1 limit 1;

-- name: ListUsers :many
select id, username, email, profile
from users
order by username;

-- name: CreateUser :one
insert into users(
    username, email, profile
)values($1, $2, $3)
returning *;

-- name: UpdateUser :exec
update users
    set
        username = $2,
        email = $3,
        profile = $4
where  id = $1;


-- name: DeleteUser :exec
delete from users
where id = $1;