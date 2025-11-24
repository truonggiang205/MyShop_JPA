package vn.truonggiang.service;

import vn.truonggiang.entity.User;
import vn.truonggiang.repository.IUserRepository;
import vn.truonggiang.repository.UserRepository;

public class UserService implements IUserService {
    
    private IUserRepository userRepo = new UserRepository();
    
    @Override
    public User login(String username, String password) {
        User user = userRepo.findByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }
    
    @Override
    public User findById(int id) {
        return userRepo.findById(id);
    }
    
    @Override
    public void register(User user) {
        userRepo.insert(user);
    }
}