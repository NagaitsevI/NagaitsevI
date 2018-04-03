package nntu.irit.asu.repository;

import nntu.irit.asu.entity.Client;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ClientRepository extends JpaRepository<Client, Long> {
}
