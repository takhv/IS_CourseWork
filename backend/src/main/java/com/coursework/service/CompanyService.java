package com.coursework.service;

import com.coursework.model.Company;
import com.coursework.repository.CompanyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompanyService {
    @Autowired
    private CompanyRepository companyRepository;

    public List<Company> getAllCompanies() {
        return companyRepository.findAll();
    }

    public Company getCompanyById(Long id) {
        return companyRepository.findById(id).orElse(null);
    }

    public Company createCompany(Company company) {
        return companyRepository.save(company);
    }
}
