// Real IDM-VTON API Integration
class IDMVTONClient {
    constructor() {
        this.baseUrl = 'https://yisol-idm-vton.hf.space';
        this.apiEndpoint = '/api/v0/predict';
    }

    // Convert file to base64 for API submission
    async fileToBase64(file) {
        return new Promise((resolve, reject) => {
            const reader = new FileReader();
            reader.onload = () => resolve(reader.result);
            reader.onerror = reject;
            reader.readAsDataURL(file);
        });
    }

    // Upload file to temporary storage and get URL
    async uploadFile(file) {
        try {
            const formData = new FormData();
            formData.append('file', file);
            
            // For now, we'll convert to base64 and use a data URL
            const base64 = await this.fileToBase64(file);
            return base64;
        } catch (error) {
            console.error('File upload error:', error);
            throw error;
        }
    }

    // Call the IDM-VTON API
    async runVirtualTryOn(params, progressCallback) {
        try {
            progressCallback({ percent: 10, text: 'Preparing images for processing...', status: 'running' });

            // Prepare the API payload according to the Hugging Face documentation
            const payload = {
                fn_index: 0, // This corresponds to the /tryon endpoint
                data: [
                    {
                        background: params.personImage, // File or URL
                        layers: [],
                        composite: null
                    },
                    params.garmentImage, // File or URL  
                    params.garmentDescription || "A stylish garment for virtual try-on",
                    params.useAutoMask !== false, // is_checked (auto-masking)
                    params.cropImage || false, // is_checked_crop
                    params.denoiseSteps || 30, // denoise_steps
                    params.seed || 42 // seed
                ]
            };

            progressCallback({ percent: 25, text: 'Sending request to IDM-VTON API...', status: 'running' });

            // Make the API call
            const response = await fetch(`${this.baseUrl}${this.apiEndpoint}`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(payload)
            });

            if (!response.ok) {
                throw new Error(`API request failed: ${response.status}`);
            }

            progressCallback({ percent: 50, text: 'Processing virtual try-on...', status: 'running' });

            const result = await response.json();
            
            progressCallback({ percent: 90, text: 'Finalizing results...', status: 'running' });

            // Process the API response
            if (result.data && result.data.length >= 2) {
                const [outputImage, maskedImage] = result.data;
                
                return {
                    status: 'success',
                    results: [
                        {
                            title: 'Virtual Try-On Result',
                            url: outputImage,
                            type: 'result'
                        }
                    ],
                    metadata: {
                        timestamp: new Date().toISOString(),
                        parameters: params,
                        apiResponse: result
                    }
                };
            } else {
                throw new Error('Invalid API response format');
            }

        } catch (error) {
            console.error('IDM-VTON API error:', error);
            
            // Fallback to demo mode on API failure
            progressCallback({ percent: 50, text: 'API unavailable, using demo mode...', status: 'running' });
            return this.generateDemoResult(params, progressCallback);
        }
    }

    // Fallback demo result
    async generateDemoResult(params, progressCallback) {
        // Simulate processing steps
        const steps = [
            { percent: 60, text: 'Demo mode: Simulating virtual try-on...', delay: 1000 },
            { percent: 80, text: 'Demo mode: Generating result...', delay: 2000 },
            { percent: 95, text: 'Demo mode: Finalizing...', delay: 1000 },
            { percent: 100, text: 'Demo complete!', delay: 500 }
        ];

        for (const step of steps) {
            progressCallback({ ...step, status: 'running' });
            await new Promise(resolve => setTimeout(resolve, step.delay));
        }

        return {
            status: 'success',
            results: [
                {
                    title: 'Virtual Try-On Result (Demo)',
                    url: `https://picsum.photos/seed/${params.seed || 42}/512/768`,
                    type: 'result'
                }
            ],
            metadata: {
                timestamp: new Date().toISOString(),
                parameters: params,
                mode: 'demo'
            }
        };
    }
}

// Enhanced Virtual Try-On with real API integration
class EnhancedVirtualTryOn {
    constructor() {
        this.client = new IDMVTONClient();
        this.currentWorkflowId = null;
        this.uploadedFiles = {
            person: null,
            garment: null
        };
    }

    // Set uploaded files
    setUploadedFile(type, file) {
        this.uploadedFiles[type] = file;
        console.log(`${type} file uploaded:`, file.name);
    }

    // Get file or URL for processing
    async getFileForProcessing(type, urlValue) {
        const uploadedFile = this.uploadedFiles[type];
        
        if (uploadedFile) {
            console.log(`Using uploaded ${type} file:`, uploadedFile.name);
            return await this.client.uploadFile(uploadedFile);
        } else if (urlValue && this.isValidUrl(urlValue)) {
            console.log(`Using ${type} URL:`, urlValue);
            return urlValue;
        } else {
            throw new Error(`Please provide a ${type} image (upload file or enter URL)`);
        }
    }

    // Run virtual try-on with real API
    async runVirtualTryOn(params, progressCallback) {
        try {
            progressCallback({ percent: 5, text: 'Preparing images...', status: 'running' });
            
            // Get person and garment images (files or URLs)
            const personImage = await this.getFileForProcessing('person', params.personUrl);
            const garmentImage = await this.getFileForProcessing('garment', params.garmentUrl);
            
            // Prepare parameters for API
            const apiParams = {
                personImage: personImage,
                garmentImage: garmentImage,
                garmentDescription: params.garmentDescription || "A stylish garment",
                useAutoMask: params.useAutoMask !== false,
                cropImage: params.cropImage || false,
                denoiseSteps: params.steps || 30,
                seed: params.seed || 42
            };
            
            // Call the real API
            return await this.client.runVirtualTryOn(apiParams, progressCallback);
            
        } catch (error) {
            console.error('Virtual try-on error:', error);
            throw error;
        }
    }

    // Utility function to validate URLs
    isValidUrl(string) {
        try {
            new URL(string);
            return string.startsWith('http://') || string.startsWith('https://');
        } catch (_) {
            return false;
        }
    }

    // Clear uploaded files
    clearUploadedFiles() {
        this.uploadedFiles = { person: null, garment: null };
    }

    // Get current status
    getStatus() {
        return {
            uploadedFiles: this.uploadedFiles,
            hasPersonFile: !!this.uploadedFiles.person,
            hasGarmentFile: !!this.uploadedFiles.garment
        };
    }
}

// Export for use in main application
if (typeof window !== 'undefined') {
    window.IDMVTONClient = IDMVTONClient;
    window.EnhancedVirtualTryOn = EnhancedVirtualTryOn;
}