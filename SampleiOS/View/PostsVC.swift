//
//  PostsVC.swift
//  SampleiOS
//
//  Created by Krunalb on 29/05/24.
//

import UIKit

class PostsVC: BaseVC {
    @IBOutlet weak var tableView: UITableView!
    var viewModel: PostsVM!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func fetchPosts() {
        viewModel.fetchNextPosts()
    }
    
    private func showAlert(_ isError: Bool, message: String) {
        self.showAlertMessage(title: isError ? "Error" : "Success",
                              message: message)
    }
}

//MARK: - PostsView Provider
extension PostsVC: PostsViewProvider {
    
    func updateLoadingState(_ state: LoadingState) {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func usersLoadingSuccessful() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func usersLoadingFailed(with error: String) {
        DispatchQueue.main.async { [weak self] in
            self?.showAlert(true, message: error)
        }
    }
    
}

//MARK: - UITableView DataSource
extension PostsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.viewModel.numberOfPosts() > indexPath.row {
            let cell = tableView.dequeueReusableCell(indexPath: indexPath) as PostCell
            cell.setupCell(self.viewModel.getPost(indexPath.row))
            return cell
        }
        // Show Loading TableView cell
        let cell = tableView.dequeueReusableCell(indexPath: indexPath) as LoadingPostCell
        cell.setupCell(state: self.viewModel.allPostsLoaded ? .none : .loading,
                       message: self.viewModel.allPostsLoaded ? "No more Posts!" : "Loading posts...")
        return cell
    }
    
}


//MARK: - UITableView Delegate
extension PostsVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if self.viewModel.numberOfPosts() == indexPath.row {
            self.fetchPosts()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.viewModel.numberOfPosts() > indexPath.row {
            self.coordinator?.startPostDetailsVC(self.viewModel.getPost(indexPath.row))
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
