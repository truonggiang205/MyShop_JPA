package vn.truonggiang.config;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JPAConfig {
    
    private static EntityManagerFactory emf;
    
    static {
        try {
            System.out.println("🔄 Initializing EntityManagerFactory...");
            emf = Persistence.createEntityManagerFactory("jpaDemo");
            System.out.println("✅ EntityManagerFactory initialized successfully!");
        } catch (Exception e) {
            System.err.println("❌ Failed to initialize EntityManagerFactory!");
            e.printStackTrace();
            throw new ExceptionInInitializerError(e);
        }
    }
    
    public static EntityManager getEntityManager() {
        if (emf == null) {
            throw new IllegalStateException("EntityManagerFactory is not initialized!");
        }
        return emf.createEntityManager();
    }
    
    public static void close() {
        if (emf != null && emf.isOpen()) {
            emf.close();
            System.out.println("✅ EntityManagerFactory closed.");
        }
    }
    
    // Kiểm tra kết nối
    public static boolean testConnection() {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.createNativeQuery("SELECT 1").getSingleResult();
            System.out.println("✅ Database connection test successful!");
            return true;
        } catch (Exception e) {
            System.err.println("❌ Database connection test failed!");
            e.printStackTrace();
            return false;
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }
}