package main.java.controller;

import main.java.exception.DAOException;

import java.io.IOException;

public interface Controller {
    void start() throws IOException, DAOException;
}
