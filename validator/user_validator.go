package validator

import (
	"go-rest-api/model"

	validation "github.com/go-ozzo/ozzo-validation/v4"
	"github.com/go-ozzo/ozzo-validation/v4/is"
)

type IUserValidator interface {
	UserValidate(user model.User) error
}

type userValidator struct{}

func NewUserValidator() IUserValidator {
	return &userValidator{}
}

func (tv *userValidator) UserValidate(user model.User) error {
	return validation.ValidateStruct(&user,
		validation.Field(
			&user.Email,
			validation.Required.Error("email is required."),
			validation.RuneLength(1, 30).Error("Limited max 30 char"),
			is.Email.Error("It isn't Email format."),
		),
		validation.Field(
			&user.Password,
			validation.Required.Error("Password is required"),
			validation.RuneLength(6, 30).Error("limited min 6max"),
		),
	)
}
