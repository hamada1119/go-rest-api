package validator

import (
	"go-rest-api/model"

	validation "github.com/go-ozzo/ozzo-validation/v4"
)

type ITaskValidator interface {
	TaskValidate(task model.Task) error
}

type TaskValidator struct{}

func NewTaskValidator() ITaskValidator {
	return &TaskValidator{}
}

func (tv *TaskValidator) TaskValidate(task model.Task) error {
	return validation.ValidateStruct(&task,
		validation.Field(
			&task.Title,
			validation.Required.Error("title is required."),
			validation.RuneLength(1, 30).Error("Limited max 30 char"),
		),
	)
}
