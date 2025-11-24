package vn.truonggiang.model;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserModel implements Serializable {
	
	private static final long serialVersionUID = 1L;

	private int id;

	private String email;

	private String fullName;

	private String password;
}
